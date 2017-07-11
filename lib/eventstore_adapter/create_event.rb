module EventstoreAdapter
  class CreateEvent
    include HTTParty
    base_uri "event_store:2113"

    def initialize(service, page)
      @options = { query: { site: service, page: page } }
    end

    def questions
      self.class.get("/2.2/questions", @options)
    end

    def users
      self.class.get("/2.2/users", @options)
    end
  end
end
