# frozen_string_literal: true

require "spec_helper"

RSpec.describe EventStoreAdapter::CreateEvent do
  describe "#create" do
    let(:stream) { "newstream" }
    let(:event_type) { "test_event" }
    let(:event_id) { SecureRandom.uuid }
    let(:message) { { someevent: "message body" } }

    subject { described_class.new(stream, event_id, event_type, message).create }

    it "creates event in event store" do
      VCR.use_cassette "create_event" do
        expect(subject.headers["location"]).to eq "http://event_store:2113/streams/newstream/29"
      end
    end

    it "creates event in event store" do
      VCR.use_cassette "create_event" do
        expect(subject.response.code).to eq "201"
      end
    end
  end
end
