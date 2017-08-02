# frozen_string_literal: true

require "spec_helper"

RSpec.describe EventStoreAdapter::CreateEvent do
  describe "#write" do
    let(:stream) { "newstream" }
    let(:event_type) { "test_event" }
    let(:event_id) { SecureRandom.uuid }
    let(:message) { { "someevent" => "message body" } }

    subject { described_class.new(stream: stream, event_type: event_type, message: message, event_id: event_id).write }

    it "sends correct request" do
      VCR.use_cassette "create_event" do
        request = [{ "eventId" => event_id, "eventType" => event_type, "data" => message }]
        expect(JSON.parse(subject.request.options[:body])).to eq request
      end
    end

    it "creates event in event store" do
      VCR.use_cassette "create_event" do
        expect(subject.headers["location"]).to eq "http://event_store:2113/streams/newstream/29"
      end
    end

    it "returns code 201 (created)" do
      VCR.use_cassette "create_event" do
        expect(subject.response.code).to eq "201"
      end
    end
  end
end
