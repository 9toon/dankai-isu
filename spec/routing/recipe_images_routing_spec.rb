require "rails_helper"

RSpec.describe RecipeImagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/recipe_images").to route_to("recipe_images#index")
    end

    it "routes to #new" do
      expect(:get => "/recipe_images/new").to route_to("recipe_images#new")
    end

    it "routes to #show" do
      expect(:get => "/recipe_images/1").to route_to("recipe_images#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/recipe_images/1/edit").to route_to("recipe_images#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/recipe_images").to route_to("recipe_images#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/recipe_images/1").to route_to("recipe_images#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/recipe_images/1").to route_to("recipe_images#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/recipe_images/1").to route_to("recipe_images#destroy", :id => "1")
    end

  end
end
