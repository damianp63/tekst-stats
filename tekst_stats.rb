class TextStats
  attr_accessor :text
  def initialize(text)
    self.text = text
  end

  def tokens
    @text.split
  end


end

puts TextStats.new(STDIN.read).tokens.inspect
