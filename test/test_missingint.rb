require 'helper'

class TestMissingInt < Test::Unit::TestCase
  def test_missing_int
    assert_equal( 3, [4,1,5,2].missing_int )
    assert_equal( 4, [2,1,3].missing_int )
    assert_equal( 1, [3,2].missing_int )
    assert_equal( 3, [1,2].missing_int )
    assert_equal( -1, [].missing_int )
    ex = assert_raise( NoMethodError ) { 2.missing_int }
    assert_match( /undefined method `missing_int'/, ex.message )
  end
  
end

