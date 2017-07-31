# frozen_string_literal: true

module EventStoreAdapter
  class CreateEvent
    include HTTParty
    base_uri EventStoreAdapter.configuration.base_uri

    DEFAULT_HEADERS = { "Content-Type" => "application/vnd.eventstore.events+json" }.freeze

    def initialize(stream, event_id, event_type, message, headers = {})
      # binding.pry
      self.stream = stream
      self.event_type = event_type
      self.message = message
      self.event_id = ::UUID.validate(event_id).nil? ? SecureRandom.uuid : event_id
      self.headers = headers
    end

    def create
      self.class.post("/streams/#{stream}", options)
    end

    private

    attr_accessor :stream, :event_id, :event_type, :message, :headers

    def body
      @body ||= [
        {
          eventId: event_id,
          eventType: event_type,
          data: message
        }
      ]
    end

    def options
      @options ||= {
        body: body.to_json,
        headers: DEFAULT_HEADERS.merge(headers)
      }
    end
  end
end
