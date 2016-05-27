require 'redis'

Redis.current = Redis.new(host: Rails.application.config.redis[:host], port: Rails.application.config.redis[:port])
