class TextStats
  attr_accessor :text

  def initialize(text)
    self.text = text
  end

  def tokens
    text.scan(/\w+/)
  end

  def stats
    token = tokens
    token.each_with_object(Hash.new(0)) do |item, memo|
      i = 0
      token.each { |word| if word == item then i += 1 end }
      memo[item] = i
    end
  end
end

puts TextStats.new(STDIN.read).stats.inspect
