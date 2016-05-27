module PvCount
  class << self
    def increment(controller_name, action_name, cnt: 1)
      storage.incrby(pv_key(controller_name, action_name), cnt)
    end

    def fetch(controller_name, action_name)
      storage.get(pv_key(controller_name, action_name)).to_i
    end

    def delete_all_pvs
      storage.keys("pv:*").each { |key| storage.del(key) }
    end

    def pv_key(controller_name, action_name)
      "pv:controller:#{controller_name}:action:#{action_name}"
    end

    def storage
      @storage ||= Redis.current
    end
  end
end
