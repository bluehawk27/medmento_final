class FrequencyPeriod < ActiveRecord::Base
  has_many :clockwork_events
  # attr_accessible :name
end