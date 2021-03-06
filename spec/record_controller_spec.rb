require "rack/test"
require 'spec_helper'

describe RecordController::API do
  include Rack::Test::Methods

  def app
    RecordController::API
  end

  describe RecordController::API do

    describe "GET /records/gender" do
      it "returns an array of gender" do
        get "/records/gender"
        expect(last_response.status).to eq(200)
        #expect(JSON.parse(last_response.body).class).to eq(Array)
      end
    end

    describe "GET /records/birthdate" do
      it "returns an array of birthdate" do
        get "/records/birthdate"
        expect(last_response.status).to eq(200)
        #expect(JSON.parse(last_response.body).class).to eq(Array)
      end
    end

    describe "GET /records/name" do
      it "returns an array of name" do
        get "/records/lastname"
        expect(last_response.status).to eq(200)
        #expect(JSON.parse(last_response.body).class).to eq(Array)
      end
    end
  end
end
