require 'rails_helper'

RSpec.describe "recipe_images/show", type: :view do
  before(:each) do
    @recipe_image = assign(:recipe_image, RecipeImage.create!(
      :recipe_id => 1,
      :path => "Path"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Path/)
  end
end
