require 'tmpdir'

class RecipeImage < ActiveRecord::Base
  belongs_to :recipe

  def path
    "/uploads/recipe_images/#{self.id}.jpg"
  end

  def upload_to
    "public#{path}"
  end

  def resize
    result = nil
    Dir.mktmpdir do |tmpdir|
      dst = File.join(tmpdir, 'resized.jpeg')
      unless system("convert", "-resize", '300x', Rails.root.join(upload_to).to_s, dst)
        raise "Converting image failed"
      end
      result = File.binread(dst)
    end
    result
  end
end
