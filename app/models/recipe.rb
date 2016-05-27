class Recipe < ActiveRecord::Base
  has_many :recipe_images
  has_many :steps, -> { order("id") }

  after_commit :increment_recipes, on: :create
  after_commit :decrement_recipes, on: :destroy

  def viewed!
    PvCount.increment_recipe_pv(self.id)
  end

  def view_count
    PvCount.fetch_recipe_pv(self.id)
  end

  def self.redis_total_count
    RecipeCount.fetch
  end

  private

  def increment_recipes
    RecipeCount.increment
  end

  def decrement_recipes
    RecipeCount.decrement
  end
end
