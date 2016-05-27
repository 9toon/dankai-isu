class RecipeImagesController < ApplicationController
  before_action :set_recipe_image, only: [:show, :edit, :update, :destroy]
  before_action :set_recipe, only: [:new]

  # GET /recipe_images
  # GET /recipe_images.json
  def index
    @recipe_images = RecipeImage.all
  end

  # GET /recipe_images/1
  # GET /recipe_images/1.json
  def show
    respond_to do |format|
      format.jpeg { send_data @recipe_image.resize }
    end
  end

  # GET /recipe_images/new
  def new
    @recipe_image_form = RecipeImageForm.new
  end

  # GET /recipe_images/1/edit
  def edit
  end

  # POST /recipe_images
  # POST /recipe_images.json
  def create
    @recipe_image_form = RecipeImageForm.new(recipe_image_params)

    respond_to do |format|
      if recipe_image = @recipe_image_form.save
        format.html { redirect_to @recipe_image_form.recipe, notice: 'Recipe image was successfully created.' }
        format.json { render :show, status: :created, location: recipe_image }
      else
        format.html { render :new }
        format.json { render json: @recipe_image_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_images/1
  # PATCH/PUT /recipe_images/1.json
  def update
    respond_to do |format|
      if @recipe_image.update(recipe_image_params)
        format.html { redirect_to @recipe_image, notice: 'Recipe image was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe_image }
      else
        format.html { render :edit }
        format.json { render json: @recipe_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_images/1
  # DELETE /recipe_images/1.json
  def destroy
    @recipe_image.destroy
    respond_to do |format|
      format.html { redirect_to recipe_images_url, notice: 'Recipe image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_image
      @recipe_image = RecipeImage.find(params[:id])
    end

    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_image_params
      params.require(:recipe_image_form).permit(:recipe_id, :data)
    end
end
