require 'rubygems'
require "twilio-ruby"

class WebhooksController < ApplicationController
  include WebhooksHelper

  def reminder
    @post_to = "#{ENV['BASE_URL']}/log_pain"
    @event = ClockworkEvent.find_by(patient_number: parsed_phone(params["Called"]))

    render "reminder.xml.builder", :layout => false
  end

  def log_pain
    event = ClockworkEvent.find_by(patient_number: parsed_phone(params["Called"]))
    @new_pain_rating = PainRating.new(rating: params['Digits'], clockwork_event_id: event.id)

    if @new_pain_rating.save
      render "thank_you_goodbye.xml.builder", :layout => false
    else
      # does not render invalid.xml
      @redirect_to = "#{ENV['BASE_URL']}/reminder"
      render "invalid_num.xml.builder", :layout => false
    end

  end
end
