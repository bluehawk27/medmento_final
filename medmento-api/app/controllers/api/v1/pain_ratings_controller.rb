module Api
  module V1
    class PainRatingsController < ApplicationController
      respond_to :json

      def index
        event = ClockworkEvent.find(params['clockwork_event_id'])
        respond_with PainRating.where(clockwork_event_id: event.id)
      end

    end
  end
end
