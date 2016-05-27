require 'rails_helper'

RSpec.describe "recipe_images/index", type: :view do
  before(:each) do
    assign(:recipe_images, [
      RecipeImage.create!(
        :recipe_id => 1,
        :path => "Path"
      ),
      RecipeImage.create!(
        :recipe_id => 1,
        :path => "Path"
      )
    ])
  end

  it "renders a list of recipe_images" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Path".to_s, :count => 2
  end
end
