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
    statistics = ""
    token = text
    sorted_stats.each { |item| statistics += "[#{item[0]}:#{item[1]}] " }
    token = token.gsub(/\w+/) { |word| "[" + word + "]" }
    "#{self.class} text: #{text}, tokenized: #{token}, stats: #{statistics}"
  end
end

print TextStats.new(STDIN.read).show.inspect
