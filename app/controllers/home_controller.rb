class HomeController < ApplicationController
  def initialize
# irb(main):006:0> Step.pluck(:id).max
#    (110.2ms)  SELECT `steps`.`id` FROM `steps`
# => 400000
# irb(main):007:0> Recipe.pluck(:id).max
#    (28.0ms)  SELECT `recipes`.`id` FROM `recipes`
# => 100000
    Recipe.where("id > ?", 100000).delete_all
    Recipe.update_all(view_count: 0)
    Step.where("id > ?", 400000).delete_all
    RecipeImage.delete_all
    Pv.delete_all
    PvCount.delete_all_pvs
    recipe_images_dir = Rails.root.join("public/uploads/recipe_images")
    recipe_images_dir.rmtree
    recipe_images_dir.mkpath
  end
end
