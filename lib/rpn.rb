class Rpn
  attr_accessor :string

  def initialize(string:)
    @string = string
  end

  def calc
    cache = []
    parse.each do |i|
      if i.is_a? Integer
        cache << i
      elsif cache.count == 2
        result = eval("#{cache[0]}#{i}#{cache[1]}")
        cache = []
        cache << result
      elsif cache.count == 3
        partial_result = eval("#{cache[1]}#{i}#{cache[2]}")
        result = cache[0]
        cache = [result, partial_result]
      end
    end
    cache.first
  end

  private

  def parse
    @string.split(' ').map do |partial|
      if is_i?(partial)
        partial.to_i
      elsif %w{+ - * /}.include? partial
        partial
      else
        raise "Invalid character: #{partial.inspect}"
      end
    end
  end

  def is_i?(string)
    !!(string =~ /\A[-+]?[0-9]+\z/)
  end
end
