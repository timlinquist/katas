require 'rubygems'
require 'test/unit'

require_relative 'binary_search'

class BinarySearchTest < Test::Unit::TestCase
  def test_chop
    assert_equal(-1, BinarySearch.chop(3, []))
    assert_equal(-1, BinarySearch.chop(3, [1]))
    assert_equal(0,  BinarySearch.chop(1, [1]))
    #
    assert_equal(0,  BinarySearch.chop(1, [1, 3, 5]))
    assert_equal(1,  BinarySearch.chop(3, [1, 3, 5]))
    assert_equal(2,  BinarySearch.chop(5, [1, 3, 5]))
    assert_equal(-1, BinarySearch.chop(0, [1, 3, 5]))
    assert_equal(-1, BinarySearch.chop(2, [1, 3, 5]))
    assert_equal(-1, BinarySearch.chop(4, [1, 3, 5]))
    assert_equal(-1, BinarySearch.chop(6, [1, 3, 5]))
    #
    assert_equal(0,  BinarySearch.chop(1, [1, 3, 5, 7]))
    assert_equal(1,  BinarySearch.chop(3, [1, 3, 5, 7]))
    assert_equal(2,  BinarySearch.chop(5, [1, 3, 5, 7]))
    assert_equal(3,  BinarySearch.chop(7, [1, 3, 5, 7]))
    assert_equal(-1, BinarySearch.chop(0, [1, 3, 5, 7]))
    assert_equal(-1, BinarySearch.chop(2, [1, 3, 5, 7]))
    assert_equal(-1, BinarySearch.chop(4, [1, 3, 5, 7]))
    assert_equal(-1, BinarySearch.chop(6, [1, 3, 5, 7]))
    assert_equal(-1, BinarySearch.chop(8, [1, 3, 5, 7]))
  end
end
