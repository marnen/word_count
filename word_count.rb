#!/usr/bin/env ruby
Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"].each {|file| require file }

sentences = []
ARGF.each('.') {|s| sentences << s }

frequency_table = WordCounter.count sentences
full_table = []
frequency_table.each {|key, value| full_table << [key, value.length, value.inspect] }

puts full_table.sort_by! {|row| -row[1] }.collect {|row| row.join ', '}