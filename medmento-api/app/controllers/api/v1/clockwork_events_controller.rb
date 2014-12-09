module Api
  module V1
    class ClockworkEventsController < ApplicationController
      respond_to :json

      def index
        respond_with ClockworkEvent.all
      end

      def create
        @event = ClockworkEvent.create(event_params)
        respond_with @event do |format|
          format.json { render json: @event.to_json }
        end
      end

      def show
        respond_with ClockworkEvent.find(params[:id])
      end

      def update
        respond_with ClockworkEvent.update(params[:id], event_params)
      end

      def destroy
        respond_with ClockworkEvent.destroy(params[:id])
      end

      private
      def event_params
        params.permit(:patient_name, :drug_name, :message, :patient_number, :frequency_quantity, :frequency_period_id, :at)
      end
    end
  end
end
