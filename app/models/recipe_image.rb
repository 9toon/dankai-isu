require 'tmpdir'

class RecipeImage < ActiveRecord::Base
  belongs_to :recipe

  def path
    "/uploads/recipe_images/#{self.id}.jpeg"
  end

  def upload_to
    "public#{path}"
  end

  def resized_path
    "/uploads/recipe_images/resized/#{self.id}.jpeg"
  end

  def resized_to
    "public#{resized_path}"
  end

  def resize
    if File.exist? resized_to
      File.binread(resized_to)
    else
      unless system("convert", "-resize", "300x", Rails.root.join(upload_to).to_s, resized_to)
        raise "Converting image failed"
      end
      File.binread(resized_to)
    end
  end
end
