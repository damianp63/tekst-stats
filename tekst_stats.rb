class TextStats
  attr_accessor :text

  def initialize(text)
    self.text = text
  end

  def tokens
    text.scan(/\w+/)
  end

  def count
    tokens.each_with_object(Hash.new(0)) { |item, memo| memo[item] += 1 }
  end

  def sorted_stats
    count.sort_by { |token, count| [-count, token] }
  end

  def show
    stats = sorted_stats.reduce([]) { |memo, item| memo << item.join(':') }.join('] [') + ']'
    token = text.gsub(/\w+/) { |word| "[#{word}]" }
    "#{self.class} text: #{text.inspect}, tokenized: #{token.inspect}, stats: #{stats.inspect}"
  end
end

print TextStats.new(STDIN.read).show
