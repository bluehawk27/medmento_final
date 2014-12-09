require_relative "../config/boot"
require_relative "../config/environment"

require 'clockwork'
require 'clockwork/database_events'

module Clockwork

  Clockwork.manager = DatabaseEvents::Manager.new
  sync_database_events model: ClockworkEvent, every: 10.seconds do |model_instance|

    TwilioWorker.perform_async(model_instance.patient_number)
  end

end
