class Recipe < ActiveRecord::Base
  has_many :recipe_images
  has_many :steps, -> { order("id") }

  def viewed!
    PvCount.increment_recipe_pv(self.id)
  end
end
