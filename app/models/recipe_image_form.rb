class RecipeImageForm
  include ActiveModel::Model

  attr_accessor :recipe_id, :data

  def save
    return false unless valid?

    recipe_image = RecipeImage.create(recipe_id: recipe_id)
    FileUtils.cp(self.data.path, recipe_image.upload_to)
    FileUtils.chmod(0777, [recipe_image.upload_to])
    recipe_image
  end

  def recipe
    Recipe.find(self.recipe_id)
  end
end
