class TextStats
  def initialize(sourse)
    @text=sourse
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

sourse=STDIN.read

text=TextStats.new(sourse)
puts text.tokenized
