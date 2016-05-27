module PvCount
  class Storage
    def initialize(options = {})
      @redis = Redis.current
    end

    def increment(controller_name, action_name, cnt: 1)
      @redis.incrby(pv_key(controller_name, action_name), cnt)
    end

    def fetch(controller_name, action_name)
      @redis.get(pv_key(controller_name, action_name))
    end

    private

    def pv_key(controller_name, action_name)
      "pv:controller:#{controller_name}:action:#{action_name}"
    end
  end
end
