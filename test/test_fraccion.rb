require 'lib/fracc'
require 'test/unit'

class Testfraccion < Test::Unit::TestCase
  def setup
    @frac1 = fraccion.new(3,4)
    @frac2 = fraccion.new(4,5)
  end
  def tear_down
    # nothing
  end
  def test_simple
    assert_equal("(3/4)", @frac1.to_s)
    assert_equal("(20/25)", (@frac2*5).to_s)
    assert_equal("(31,20)", (@frac1 + @frac2).to_s)
  end
  def test_type_check
    assert_raise(RuntimeError) {Point.new('1','1')}
  end
  def test_failure
    assert_equal("(20,5)", (@frac1 * 5).to_s, "Producto escalar")
  end
end