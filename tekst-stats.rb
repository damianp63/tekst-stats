class TextStats
  attr_accessor :text

  def initialize(text:)
    self.text=text
  end
end

text=TextStats.new(text: STDIN.read)
