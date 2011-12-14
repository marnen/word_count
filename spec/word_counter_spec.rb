require 'spec_helper'
require 'set'

describe WordCounter do
  describe 'constructor' do
    it 'should take an array of sentences' do
      lambda { WordCounter.new ['First sentence.', 'Second sentence.'] }.should_not raise_error(ArgumentError)
    end
  end
  
  describe '#sorted_table' do
    it 'should return a hash with an element for each unique word in the input, disregarding case' do
      sentences = ['Here are some words and SOme more woRDS']
      WordCounter.new(sentences).sorted_table.collect do |row|
        row[:word]
      end.to_set.should == %w{here are some words and more}.to_set
    end
    
    it 'should ignore extra spaces and punctuation' do
      sentences = ['Period.', 'And     several  spaces, commas; and *other* stuff.']
      WordCounter.new(sentences).sorted_table.collect do |row|
        row[:word]
      end.to_set.should == %w{period and several spaces commas other stuff}.to_set
    end
    
    it 'should record sentence numbers for each word, starting from 1' do
      sentences = ['This is sentence one.', 'And Sentence Two.']
      WordCounter.new(sentences).sorted_table.to_set.should == [
        {:word => 'this', :sentences => [1]},
        {:word => 'is', :sentences => [1]},
        {:word => 'sentence', :sentences => [1, 2]},
        {:word => 'one', :sentences => [1]},
        {:word => 'and', :sentences => [2]},
        {:word => 'two', :sentences => [2]}
      ].to_set
    end
    
    it 'should return the output sorted in descending order of frequency' do
      sentences = ['Twice thrice.', 'Thrice twice.', 'Thrice once.']
      WordCounter.new(sentences).sorted_table.should == [
        {:word => 'thrice', :sentences => [1, 2, 3]},
        {:word => 'twice' , :sentences => [1, 2]},
        {:word => 'once', :sentences => [3]}
      ]
    end
  end
end
