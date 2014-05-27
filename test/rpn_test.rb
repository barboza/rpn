require 'minitest/autorun'
require 'minitest/spec'
require './../lib/rpn.rb'

describe Rpn do
  it "can't be created with no arguments" do
    Array.new.must_throw(RuntimeError)
  end
end
