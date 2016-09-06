class TextStats
  attr_accessor :text

  def initialize(text)
    self.text = text
  end

  def tokens
    text.scan(/\w+/)
  end

  def stats
    tokens.each_with_object(Hash.new(0)) { |item, memo| memo[item] += 1 }
  end

  def sort
    hash = stats
    hash = hash.sort { |previous, after| after <=> previous }
    hash.sort_by { |_key, value| value }.reverse.to_h
  end

  def show
    [tokens,sort]
  end
end

puts TextStats.new(STDIN.read).show.inspect
