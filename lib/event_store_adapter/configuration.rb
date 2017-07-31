# frozen_string_literal: true

module EventStoreAdapter
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  class Configuration
    attr_accessor :base_uri

    def initialize
      @base_uri = "event_store:2113"
    end
  end
end
