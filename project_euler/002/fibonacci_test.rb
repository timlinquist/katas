require 'rubygems'
require 'test/unit'

require_relative 'fibonacci'

class FibonacciTest < Test::Unit::TestCase
  def test_even_sum_of_terms_under_4million
    assert_equal Fibonacci.even_sum_of_terms_under_4million, 4613732
  end
end

