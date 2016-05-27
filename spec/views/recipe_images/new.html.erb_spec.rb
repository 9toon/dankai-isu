require 'rails_helper'

RSpec.describe "recipe_images/new", type: :view do
  before(:each) do
    assign(:recipe_image, RecipeImage.new(
      :recipe_id => 1,
      :path => "MyString"
    ))
  end

  it "renders new recipe_image form" do
    render

    assert_select "form[action=?][method=?]", recipe_images_path, "post" do

      assert_select "input#recipe_image_recipe_id[name=?]", "recipe_image[recipe_id]"

      assert_select "input#recipe_image_path[name=?]", "recipe_image[path]"
    end
  end
end
