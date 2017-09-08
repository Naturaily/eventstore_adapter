# frozen_string_literal: true

module EventStoreAdapter
  require "httparty"
  require "securerandom"
  require "uuid"
  require "event_store_adapter/configuration"
  require "event_store_adapter/create_event"
  require "event_store_adapter/version"
end
