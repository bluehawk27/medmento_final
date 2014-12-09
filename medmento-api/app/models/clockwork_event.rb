class ClockworkEvent < ActiveRecord::Base
  belongs_to :user
  belongs_to :frequency_period
  has_many :pain_ratings, dependent: :destroy

  # attr_accessible :frequency_quantity, :frequency_period_id, :at

  # Used by clockwork to schedule how frequently this event should be run
  # Should be the intended number of seconds between executions
  def frequency
    frequency_quantity.send(frequency_period.name.pluralize)
  end
end