# frozen_string_literal: true

require "bundler/setup"
Bundler.setup

require "event_store_adapter"
require "webmock/rspec"
require "pry"
require "vcr"

def file_fixture(filename)
  open(File.join(File.dirname(__FILE__), "fixtures", filename.to_s)).read
end

Dir[File.expand_path(File.join(File.dirname(__FILE__), "support", "**", "*.rb"))].each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = false
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.disable_monkey_patching!

  config.warnings = true

  if config.files_to_run.one?
    config.default_formatter = "doc"
  end

  config.profile_examples = 10

  config.order = :random

  Kernel.srand config.seed
end
