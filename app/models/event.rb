class Event < ActiveRecord::Base
  has_many :event_users
  has_many :users, :through => :events
end
