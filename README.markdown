Usage: `./word_count.rb [file1 file2...]`; if your OS doesn't understand the `#!` line, try `ruby word_count.rb` instead, as usual. If no filenames are supplied, standard input is read instead.

The program will count the words in the provided text as further described in the file [`PROBLEM`](PROBLEM), and will print a word frequency table to STDOUT.

This script has been tested with Ruby 1.9.2, though it may work with other versions. It has no external dependencies other than the standard library; the `Gemfile` in the repository is only needed for testing.