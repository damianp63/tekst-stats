class TextStats
  attr_accessor :text

  def initialize(text)
    self.text = text
  end

  def tokens
    text.split
  end

  def stats
    statistics = []
    token = self.tokens
    token.each do |item|
      statistics << "#{item}:#{text.scan(item).size}"
    end
    statistics
  end
end

puts TextStats.new(STDIN.read).stats.inspect
