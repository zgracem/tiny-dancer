# TinyDancer

A simple command-line interface to [TinyPNG](https://tinypng.com/).

## Installation

* Download [the latest release](https://github.com/zgracem/tiny-dancer/releases/tag/v0.1.0).
* `cd ~/Downloads` (or wherever you saved the file)
* `gem install tiny_dancer-0.1.0.gem`

## Usage

* Set `TINYPNG_API_TOKEN` in your environment to your [TinyPNG API token](https://tinypng.com/dashboard/api).
* Run `tinypng image.png`:
    * `image_original.png` will be created as a backup
    * `image.png` is uploaded to TinyPNG's servers, where it is tinified
    * The smaller version of `image.png` is downloaded from TinyPNG
    * The smaller version overwrites the existing `image.png`

## Future plans

* Control overwriting behaviour
* Support more of the [API][]:
    * specify URL instead of path to local file
    * resize/crop images
    * control preservation of metadata
* Proxy support

[API]: https://tinypng.com/developers/reference/ruby

## Credits

"TinyPNG", "TinyJPG", and "Tinify" are the intellectual property of Tinify B.V.
I am not affiliated with Tinify, and this product is not endorsed or approved
by them in any way.

## Say hello

[zgm&#x40;inescapable&#x2e;org](mailto:zgm%40inescapable%2eorg)
