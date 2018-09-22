# TinyDancer

A simple command-line interface to [TinyPNG](https://tinypng.com/).

## Installation

* Download [the latest release](https://github.com/zgracem/tiny-dancer/releases/tag/v0.1.0).
* `cd ~/Downloads` (or wherever you saved the file)
* `gem install tiny_dancer-0.1.0.gem`

## Usage

* Set `TINYPNG_API_TOKEN` in your environment to your [TinyPNG API token](https://tinypng.com/dashboard/api).
* Run `tinypng file.png`:
    * `file_original.png` will be created as a backup
    * `file.png` is uploaded to TinyPNG's servers, where it is tinified
    * The smaller version of `file.png` is downloaded from TinyPNG
    * The smaller version overwrites the existing `file.png`
