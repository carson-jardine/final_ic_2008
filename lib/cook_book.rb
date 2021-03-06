require 'date'

class CookBook
  attr_reader :recipes, :date

  def initialize
    @recipes = []
    @date = Date.today.strftime("%m-%d-%Y")
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    @recipes.flat_map do |recipe|
      recipe.ingredients.map do |ingredient|
        ingredient.name
      end
    end.uniq
  end

  def highest_calorie_meal
    @recipes.max_by do |recipe|
      recipe.total_calories
    end
  end

  def summary
    @recipes.map do |recipe|
      {name: recipe.name,
      details:
        {ingredients: recipe.ingredients_required.map do |ingredient, amount|  
          {ingredient: ingredient.name,
          amount: amount.to_s + ' ' + ingredient.unit}
        end,
        total_calories: recipe.total_calories
        }
      }
    end
  end
end
