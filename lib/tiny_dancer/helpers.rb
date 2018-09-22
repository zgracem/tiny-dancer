module TinyHelpers
  # @param input_filename [#to_s]
  # @param suffix [#to_s] if blank, will overwrite the original file
  # @return [Pathname]
  def make_output_filename(input_filename, suffix = "_tinified")
    pn = Pathname.new(input_filename.to_s)
    pn.sub_ext("#{suffix}#{pn.extname}")
  end

  # @param size_in_bytes [#to_f]
  # @return [String]
  def format_size(size_in_bytes)
    return size_in_bytes.to_s(:human_size)
  end

  # @param arrow [#to_s]
  # @param colour [Symbol] one of `:black, :red, :green, :yellow, :blue,
  #   :magenta, :cyan, :white, :brightred, :brightwhite, :default`
  def icon(arrow, colour)
    colours = {
      black:   30, red:  31, green: 32, yellow:  33, blue: 34,
      magenta: 35, cyan: 36, white: 37, default: 39,
      brightred: 91, brightwhite: 97
    }

    colour = :default unless colours.has_key?(colour)

    sprintf "%{colour}%{arrow}%{off}",
            colour: "\e[#{colours[colour]}m",
            arrow: "#{arrow}",
            off: "\e[#{colours[:default]}m"
  end

  def say(icon, colour, message)
    puts "#{icon(icon, colour)} #{message}"
  end

  def die(error)
    warn "#{icon("✖", :red)} #{error.class}: #{error.message}"
    exit(false)
  end
end
