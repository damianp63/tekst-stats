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
    hash = []
    token = tokens
    token.each { |item| hash << { name: item, size: text.scan(item).size } }
    hash.sort_by! { |item| item[:size] }
    hash.reverse!
    hash.each { |item| statistics << "#{item[:name]}:#{item[:size]}" }
    statistics
  end
end

puts TextStats.new(STDIN.read).stats.inspect
