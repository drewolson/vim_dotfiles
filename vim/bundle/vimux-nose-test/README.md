Vimux plugin for running nose test. Similar to [vimux-ruby-test](https://github.com/pgr0ss/vimux-ruby-test)

## Requirements

- vim with ruby support (compiled +ruby)
- [vimux](https://github.com/benmills/vimux)
- optionally requires [nose-run-line-number](https://github.com/pitluga/nose-run-line-number) for focused tests.

## Installation

It's pathogen compliant, so just drop in your bundle directory

## Commands

- RunAllNoseTests - runs all the nose tests in a file
- RunFocusedNoseTests - runs the current test under the cursor (requires nose-run-line-number)

## Configuration

- NoseVirtualenv - the path to your virtualenv activate file e.g. ```.env/bin/actviate```
