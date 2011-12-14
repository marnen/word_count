#!/usr/bin/env ruby
Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"].each {|file| require file }

sentences = []
ARGF.each('.') {|s| sentences << s }

frequency_table = WordCounter.new(sentences).sorted_table
puts frequency_table.collect {|row| "#{row[:word]}, #{row[:sentences].count}, #{row[:sentences]}"}