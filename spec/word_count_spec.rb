require 'spec_helper'

describe WordCount do
  describe '#count' do
    it 'should return a hash with an element for each unique word in the input, disregarding case' do
      sentences = ['Here are some words and SOme more woRDS']
      WordCount.count(sentences).keys.should == %w{here are some words and more}
    end
    
    it 'should ignore extra spaces and punctuation' do
      sentences = ['Period.', 'And     several  spaces, commas; and *other* stuff.']
      WordCount.count(sentences).keys.should == %w{period and several spaces commas other stuff}
    end
    
    it 'should record sentence numbers for each word, starting from 1' do
      sentences = ['This is sentence one.', 'And Sentence Two.']
      WordCount.count(sentences).should == {
        'this' => [1],
        'is' => [1],
        'sentence' => [1, 2],
        'one' => [1],
        'and' => [2],
        'two' => [2]
      }
    end
  end
end
