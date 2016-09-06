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
    hash = stats
    hash = hash.sort { |previous, after| after <=> previous }
    hash.sort_by { |_key, value| value }.reverse
  end

  def show
    stat = "\n"
    token = text
    sorted_stats.each { |item| stat += "[#{item[0]}:#{item[1]}] " }
    token = token.gsub(/\w+/) { |word| "[#{word}]" }
    token = token.inspect
    stat = stat.inspect
    "#{self.class} text: #{text.inspect}, tokenized: #{token}, stats: #{stat}"
  end
end

print TextStats.new(STDIN.read).show
