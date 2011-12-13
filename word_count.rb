#!/usr/bin/env ruby

class WordCount
  def self.count(string)
    string.downcase.split(%r{\W+}).uniq
  end
end
