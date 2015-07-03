class Event < ActiveRecord::Base
  def self.newest
    newests = self.order("id DESC").limit(1)
    return nil if newests.nil?
    newests[0]
  end
end
