require 'rubygems'
require 'test/unit'

require_relative 'multiples_calculator'

class MultiplesTest < Test::Unit::TestCase
  def test_sum_under_1k
    assert_equal MultiplesCalculator.sum_below_1k, 233168
  end
end
