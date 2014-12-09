require 'spec_helper'
describe Api::V1::ClockworkEventsController do

  describe "#index", type: :controller do
    before do
      get :index, :format => :json
    end

    it "should retrieve status code of 200" do
      response.response_code.should == 200
    end


    it "show a list of all the ClockworkEvents" do
      total = ClockworkEvent.all.count
      expect(response.body).to match total.to_s
    end
  end

  describe "#create", type: :controller do
    before do
      get :create, :format => :json
    end
    # before do
    #   ClockworkEvent.create(patient_name: "bob")
    # end

    it "should retrieve status code of 200" do
      response.response_code.should == 200
    end

    it "creates a new ClockworkEvent" do
      ClockworkEvent.create(patient_name: "bob")

      expect{response.body}.to change {ClockworkEvent.all.count}.by(1)
    end

  end
end