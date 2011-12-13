#!/usr/bin/env ruby

class WordCount
  def self.count(string)
    string.downcase.split.uniq
  end
end
