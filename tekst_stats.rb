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

  def sorted_stats
    stats.sort_by { |token, count| [-count, token] }
  end

  def stats_inspect
    stat = '['
    stat + sorted_stats.reduce([]) do |memo, item|
      memo << item.join(':')
    end.join('] [') + ']'.inspect
  end

  def token_inspect
    text.gsub(/\w+/) { |word| "[#{word}]" }.inspect
  end

  def text_inspect
    text.inspect
  end

  def inspect
    "#{self.class}
    text: #{text_inspect},
    tokenized: #{token_inspect},
    stats: #{stats_inspect}"
  end
end

print TextStats.new(STDIN.read).inspect
