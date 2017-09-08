# frozen_string_literal: true

module EventStoreAdapter
  class CreateEvent
    include HTTParty
    base_uri EventStoreAdapter.configuration.base_uri

    DEFAULT_HEADERS = { "Content-Type" => "application/vnd.eventstore.events+json" }.freeze

    def initialize(stream:, event_type:, message:, **options)
      self.stream = stream
      self.event_type = event_type
      self.message = message
      self.headers = options.delete(:headers)
      set_event_id(options.delete(:event_id))
    end

    def write
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
        headers: merged_headers
      }
    end

    def set_event_id(event_id)
      self.event_id = if event_id.present?
                        if ::UUID.validate(event_id).nil?
                          raise ArgumentError, "invalid event_id option"
                        end
                        event_id
                      else
                        SecureRandom.uuid
                      end
    end

    def merged_headers
      if headers.nil?
        DEFAULT_HEADERS
      else
        DEFAULT_HEADERS.merge(headers)
      end
    end
  end
end
