require 'spec_helper'

describe WordCounter do
  describe 'constructor' do
    it 'should take an array of sentences' do
      lambda { WordCounter.new ['First sentence.', 'Second sentence.'] }.should_not raise_error(ArgumentError)
    end
  end
  
  describe '#sorted_table' do
    it 'should return a hash with an element for each unique word in the input, disregarding case' do
      sentences = ['Here are some words and SOme more woRDS']
      WordCounter.new(sentences).sorted_table.collect(&:first).should == %w{here are some words and more}
    end
    
    it 'should ignore extra spaces and punctuation' do
      sentences = ['Period.', 'And     several  spaces, commas; and *other* stuff.']
      WordCounter.new(sentences).sorted_table.collect(&:first).should == %w{period and several spaces commas other stuff}
    end
    
    it 'should record sentence numbers for each word, starting from 1' do
      sentences = ['This is sentence one.', 'And Sentence Two.']
      WordCounter.new(sentences).sorted_table.should == {
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
