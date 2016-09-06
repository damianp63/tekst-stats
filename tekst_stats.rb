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
    hash = token.each_with_object(Hash.new(0)) { |item, memo| memo[item] += 1 }
    hash = hash.sort { |previous,after| after<=>previous}
    hash = hash.sort_by { |_key, value| value }.reverse.to_h
  end
end

puts TextStats.new(STDIN.read).stats.inspect
