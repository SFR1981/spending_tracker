require("minitest/autorun")
require_relative("../tag.rb")


class TestTag < MiniTest::Test

  def setup
    @emojis = Emojis.new
    options = {"id" => 1, "name" => "Travel"}


    @tag = Tag.new(options)
  end

  def test_id()
    result = @tag.id()
    assert_equal(1, result)
  end

  def test_name()
    result = @tag.name()
    assert_equal("Travel", result)
  end



end
