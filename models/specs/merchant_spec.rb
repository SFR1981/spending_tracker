require("minitest/autorun")
require_relative("../merchant.rb")


class TestMerchant < MiniTest::Test

  def setup

    options = {"id" => 1, "name" => "Travel", "icon" => "/images/1.png", "active" => true}


    @merchant = Merchant.new(options)
  end

  def test_id()
    result = @merchant.id()
    assert_equal(1, result)
  end


end
