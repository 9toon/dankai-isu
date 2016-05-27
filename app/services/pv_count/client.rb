module PvCount
  class Client
    def increment(controller_name, action_name)
      PvCount.storage.increment(controller_name, action_name)
    end
  end
end
