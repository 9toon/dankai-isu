class Recipe < ActiveRecord::Base
  has_many :recipe_images
  has_many :steps, -> { order("id") }

  def viewed!
    transaction do
      self.lock!
      self.view_count += 1
      self.save!
    end
  end
end
