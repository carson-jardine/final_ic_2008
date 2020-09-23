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
end
# => #<Pantry:0x007fd8858863b8...>

# @pantry.stock
# => {}

# @pantry.stock_check(ingredient1)
# => 0

# @pantry.restock(ingredient1, 5)

# @pantry.restock(ingredient1, 10)

# @pantry.stock_check(ingredient1)
# => 15

# @pantry.restock(ingredient2, 7)

# @pantry.stock_check(ingredient2)
# => 7
