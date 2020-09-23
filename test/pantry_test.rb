require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'

class PantryTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})

    @recipe1 = Recipe.new("Mac and Cheese")

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

    @pantry.restock(@ingredient2, 7)
    assert_equal 7, @pantry.stock_check(@ingredient2)
    assert_equal ({@ingredient1 => 15, @ingredient2 => 7}), @pantry.stock
  end

  def test_if_it_has_enough_ingredients_for_a_recipe
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @pantry.restock(@ingredient1, 5)

    assert_equal false, @pantry.enough_ingredients_for?(@recipe1)

    @pantry.restock(@ingredient1, 10)
    assert_equal false, @pantry.enough_ingredients_for?(@recipe1)

    @pantry.restock(@ingredient2, 7)
    assert_equal false, @pantry.enough_ingredients_for?(@recipe1)

    @pantry.restock(@ingredient2, 1)
    assert @pantry.enough_ingredients_for?(@recipe1)
  end
end
