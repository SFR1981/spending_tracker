require("minitest/autorun")
require_relative("../transaction.rb")


class TestTransaction < MiniTest::Test

  def setup

    options = {"id" => 1, "merchant_id" => 2, "tag_id" => 3, "value" => 12.99, "reference" => "train tickets"}
    options2 = {"id" => 1, "merchant_id" => 2, "tag_id" => 3, "value" => 12.99}



    @transaction = Transaction.new(options)
    @no_reference_transaction = Transaction.new(options2)
  end

  def test_id()
    result = @transaction.id()
    assert_equal(1, result)
  end

   def test_merchant_id()
    result = @transaction.merchant_id()
    assert_equal(2, result)
  end

  def test_tag_id()
    result = @transaction.tag_id()
    assert_equal(3, result)
  end

  #
  # def test_value()
  #
  # end
  #
  # def test_reference()
  #
  # end

end
