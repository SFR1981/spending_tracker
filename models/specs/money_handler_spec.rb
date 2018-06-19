require("minitest/autorun")
require_relative("../money_handler.rb")


class TestMoneyHandler < MiniTest::Test

  def setup
    @string = "99.99"
    @string2 = "0.01"
    @string3 = "2"
    @string4 = "199"
  end

  def test_decimal_checker__9999()
    result = MoneyHandler.check_decimal(@string)
    assert_equal("9999.0", result)

  end

  def test_decimal_check__001()
    result = MoneyHandler.check_decimal(@string2)
    assert_equal("1.0", result)
  end

  def test_decimal_checker__200()
    result = MoneyHandler.check_decimal(@string3)
    assert_equal("200", result)
  end

  def test_decimal_checker__19900()
    result = MoneyHandler.check_decimal(@string4)
    assert_equal("19900", result)
  end





end
