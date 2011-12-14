#!/usr/bin/env ruby
Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"].each {|file| require file }

sentences = []
ARGF.each('.') {|s| sentences << s }

frequency_table = WordCounter.new(sentences).sorted_table
puts frequency_table.collect {|row| "#{row[0]}, #{row[1].count}, #{row[1]}"}