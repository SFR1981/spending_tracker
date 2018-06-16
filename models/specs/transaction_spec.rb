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
  #
  # def test_merchant_id()
  #   result = @tag.name()
  #   assert_equal("Travel", result)
  # end
  #
  # def test_tag_id()
  #   result = @tag.icon()
  #   assert_equal(@emojis[:airplane], result)
  # end
  #
  #
  # def test_value()
  #
  # end
  #
  # def test_reference()
  #
  # end

end
