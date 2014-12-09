class TwilioWorker
  include Sidekiq::Worker

  # BASE_URL = "http://7b6048b8.ngrok.com/webhooks"
  # BASE_URL = "http://localhost:3000/appointmentreminder"
  CALLER_NUM = '+14083735458'

  def perform(phone_number)
    data = {
      "from" => CALLER_NUM,
      "to" => "#{phone_number}",
      "url" => "#{ENV['BASE_URL']}/reminder",
    }
    p data

    client = Twilio::REST::Client.new(ENV["ACCOUNT_SID"], ENV["AUTH_TOKEN"])
    client.account.calls.create(data)
  end
end