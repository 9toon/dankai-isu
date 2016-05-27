module PvCount
  class Client
    def increment(controller_name, action_name)
      PvCount.storage.increment(controller_name, action_name)
    end

    def fetch(controller_name, action_name)
      PvCount.storage.fetch(controller_name, action_name)
    end
  end
end
