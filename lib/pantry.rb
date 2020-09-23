class Pantry
  attr_reader :stock
  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, quantity)
    @stock[ingredient] += quantity
  end

  def enough_ingredients_for?(recipe)
    ingredient_check = recipe.ingredients_required.map do |ingredient, quantity|
      stock_check(ingredient) >= quantity
    end
    ingredient_check.all? {|value| value == true}
  end
end
