require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/pantry'

class PantryTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})

    @pantry = Pantry.new
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_it_can_stock_items
    assert_equal ({}), @pantry.stock
    assert_equal 0, @pantry.stock_check(@ingredient1)

    @pantry.restock(@ingredient1, 5)
    assert_equal 5, @pantry.stock_check(@ingredient1)

    @pantry.restock(@ingredient1, 10)
    assert_equal 15, @pantry.stock_check(@ingredient1)
    assert_equal ({@ingredient1 => 15}), @pantry.stock
  end
end

# @pantry.restock(@ingredient2, 7)

# @pantry.stock_check(@ingredient2)
# => 7
