require './lib/rpn.rb'

raise 'Please give a string.' unless ARGV[0]
puts Rpn.new(string: ARGV[0]).calc
