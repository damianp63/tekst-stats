class TextStats
  attr_accessor :text

  def initialize(text)
    self.text = text
  end

  def tokens
    text.scan(/\w+/)
  end

  def stats
    statistics = []
    hash = []
    token = tokens
    hash = token.each_with_object([]) { |item,memo| memo << [item] }
  end
end

puts TextStats.new(STDIN.read).stats.inspect
