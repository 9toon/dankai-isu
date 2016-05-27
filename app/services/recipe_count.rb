module RecipeCount
  class << self
    def increment(cnt: 1)
      storage.incrby(recipe_key, cnt)
    end

    def decrement(cnt: 1)
      storage.decrby(recipe_key, cnt)
    end

    def fetch
      storage.get(recipe_key).to_i
    end

    def delete_recipe_counts
      storage.del(recipe_key)
    end

    def recipe_key
      "recipes:count"
    end

    def storage
      @storage ||= Redis.current
    end
  end
end
