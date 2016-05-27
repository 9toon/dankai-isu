require 'rails_helper'

RSpec.describe "recipe_images/edit", type: :view do
  before(:each) do
    @recipe_image = assign(:recipe_image, RecipeImage.create!(
      :recipe_id => 1,
      :path => "MyString"
    ))
  end

  it "renders the edit recipe_image form" do
    render

    assert_select "form[action=?][method=?]", recipe_image_path(@recipe_image), "post" do

      assert_select "input#recipe_image_recipe_id[name=?]", "recipe_image[recipe_id]"

      assert_select "input#recipe_image_path[name=?]", "recipe_image[path]"
    end
  end
end
