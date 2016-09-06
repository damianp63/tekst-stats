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

  def show
    stat = ""
    sorted_stats.each { |item| stat += "[#{item[0]}:#{item[1]}] " }
    token = text.gsub(/\w+/) { |word| "[#{word}]" }
    tokenened_text = token.inspect
    stats = stat.inspect
    clas = self.class
    text_info = text.inspect
    "#{clas} text: #{text_info}, tokenized: #{tokenened_text}, stats: #{stats}"
  end
end

print TextStats.new(STDIN.read).show
