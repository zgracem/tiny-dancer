require "fileutils"
require "pathname"
require "io/console"
$stdout.sync = true

require "tinify"
require "active_support"
require "active_support/core_ext/numeric"

require_relative "tiny_dancer/version"
require_relative "tiny_dancer/helpers"

class TinyDancer
  include TinyHelpers

  @@validated = false

  attr_reader :infile, :outfile, :source

  def initialize(input_filename)
    @infile = Pathname.new(input_filename)
    check_file_size
    validate!
    @outfile = make_output_filename(@infile, "")

  rescue Errno::ENOENT => e
    # input file does not exist
    die(e)

  rescue Tinify::Error => e
    die(e)
  end

  def tinify!
    @source ||= Tinify.from_file(@infile)

    preserve_original_file

    say "«", :yellow,
      "#{@original_file} = #{format_size(@original_file.size?)}"

    @metadata_preserved ||= @source.preserve(:copyright, :creation)
    @metadata_preserved.to_file(@outfile.to_s)

    copy_modification_date

    print_stats

  rescue Tinify::Error => e
    die(e)
  end

  private

  def validate!
    return true if @@validated

    say "~", :magenta, "validating API key..."

    Tinify.key = ENV["TINYPNG_API_TOKEN"]
    Tinify.validate!

    @@validated = true
  end

  # @return [true] if the file can be uploaded
  # @raise [Tinify::ClientError] if the file is too large to process
  def check_file_size(max_size = 5.megabytes)
    if @infile.size? >= max_size
      raise Tinify::ClientError,
        "File too large: #{@infile} is #{format_size(@infile.size?)}"
    else
      true
    end
  end

  # @return [void]
  def preserve_original_file
    @original_file ||= make_output_filename(@infile, "_original")
    if !@original_file.exist?
      FileUtils.cp(@infile, @original_file, preserve: true)
    end
  end

  def copy_modification_date
    `touch -r "#{@original_file}" "#{@outfile}"`
  end

  def print_stats
    oldsize = @original_file.size?
    newsize = @outfile.size?

    if oldsize && newsize
      say "»", :green, "#{@outfile} = #{format_size(newsize)}"

      percent_compressed = (100.0 - ((newsize.to_f / oldsize.to_f) * 100)).round(1)
      bytes_compressed  = (oldsize - newsize).abs
      say "Δ", :cyan, "#{percent_compressed}% = #{format_size(bytes_compressed)}"

      print_compression_count
    end
  end

  def print_compression_count
    c = Tinify.compression_count
    colour =
      case
      when c > 450 then :brightred
      when c > 400 then :red
      when c > 350 then :yellow
      else              :blue
      end

    return unless c % 5 == 0

    say "≡", colour, "#{c} API uses this month"
  end
end
