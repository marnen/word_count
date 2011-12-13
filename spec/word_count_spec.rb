require 'spec_helper'

describe WordCount do
  describe '.count' do
    it 'should return an array with an element for each unique word in the input, disregarding case' do
      string = 'Here are some words and SOme more woRDS'
      WordCount.count(string).should == %w{here are some words and more}
    end
  end
end
