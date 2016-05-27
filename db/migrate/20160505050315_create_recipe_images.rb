class CreateRecipeImages < ActiveRecord::Migration
  def change
    create_table :recipe_images do |t|
      t.integer :recipe_id
      t.string :path

      t.timestamps null: false
    end
  end
end
