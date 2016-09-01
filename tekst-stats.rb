class TextStats
  def initialize(text)
    @text=text
  end

  def tokenized
    tokenized_text=[]
    temp_text=@text.scan(/\w+/)
    temp_text.each do |word|
      tokenized_text<<[word]
    end
    tokenized_text.reverse!
    return tokenized_text
  end
end

text=TextStats.new(STDIN.read)
puts text.tokenized
