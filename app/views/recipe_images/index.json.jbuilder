json.array!(@recipe_images) do |recipe_image|
  json.extract! recipe_image, :id, :recipe_id, :path
  json.url recipe_image_url(recipe_image, format: :json)
end
