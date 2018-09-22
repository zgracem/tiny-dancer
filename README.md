# TinyDancer

A simple command-line interface to [TinyPNG](https://tinypng.com/).

## Installation

TODO: Write installation instructions.

## Usage

* Set `TINYPNG_API_TOKEN` in your environment to your [TinyPNG API token](https://tinypng.com/dashboard/api).
* Run `tinypng file.png`:
    * `file_original.png` will be created as a backup
    * `file.png` is uploaded to TinyPNG's servers, where it is tinified
    * The smaller version of `file.png` is downloaded from TinyPNG
    * The smaller version overwrites the existing `file.png`
