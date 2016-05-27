module PvCount
  def self.storage
    @storage ||= PvCount::Storage.new
  end
end
