class WordCounter
  def count(sentences)
    frequency_table = {}
    
    sentences.each_with_index do |sentence, i|
      words = sentence.downcase.split(%r{\W+})
      words.each do |word|
        frequency_table[word] = frequency_table[word].to_a << (i + 1)
      end
    end
    
    frequency_table
  end
end
