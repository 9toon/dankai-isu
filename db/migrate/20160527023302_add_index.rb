class AddIndex < ActiveRecord::Migration
  def change
    add_index :steps, :recipe_id
    add_index :recipe_images, :recipe_id
  end
end
