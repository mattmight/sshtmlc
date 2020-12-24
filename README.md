# sshtmlc: a static server-side HTML compiler

## Installation

To install in your personal `$HOME/bin` folder, run:

    make localinstall


## Usage

    sshtmlc < [input shtml file] > [output html file]


## Warnings and Notes

Currently, only directives of the form `<!--#include file="[file name]" -->` are supported.

This tool may be useful if have a site with mild server-side includes, and
you're now trying to view the pages in an environment that doesn't have an
HTTPD that supports server-side includes.
