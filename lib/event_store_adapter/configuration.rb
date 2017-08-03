# frozen_string_literal: true

module EventStoreAdapter
  DEFAULT_BASE_URI = "localhost:2113"

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
      @base_uri = DEFAULT_BASE_URI
    end
  end
end
