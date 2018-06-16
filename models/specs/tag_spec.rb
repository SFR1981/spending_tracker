require("minitest/autorun")
require_relative("../tag.rb")
require('emojis')

class TestTag < MiniTest::Test

  def setup
    emojis = Emojis.new
    options = {"id" => 1, "name" => "Travel", "icon" => emojis[:airplane]}


    @tag = Tag.new(options)
  end

  def test_id()
    result = @tag.id()
    assert_equal(1, result)
  end

end
