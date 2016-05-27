require 'rails_helper'

RSpec.describe "steps/edit", type: :view do
  before(:each) do
    @step = assign(:step, Step.create!(
      :recipe_id => 1,
      :description => "MyText"
    ))
  end

  it "renders the edit step form" do
    render

    assert_select "form[action=?][method=?]", step_path(@step), "post" do

      assert_select "input#step_recipe_id[name=?]", "step[recipe_id]"

      assert_select "textarea#step_description[name=?]", "step[description]"
    end
  end
end
