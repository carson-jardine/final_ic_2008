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
    summary = Hash.new
    @recipes.each do |recipe|
      summary[:name][:details] ||= []
      summary[:name] = recipe.name
       summary[:details] = recipe.ingredients_required
    # summary_hash = {:name => nil, :details => {}}
    # @recipes.map.with_object do |recipe, hash|
    #   require "pry"; binding.pry
    #   summary_hash[:name] = recipe.name
    #   summary_hash[:details] << recipe.ingredients_required
    end
    summary
  end
end
