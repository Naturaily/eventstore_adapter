# frozen_string_literal: true

source "https://rubygems.org"

gemspec

gem "rails", "~> 5.1"
gem "rake"
gem "feedjira"

group :development do
  gem "rubocop"
end

group :test do
  gem "rspec"
  gem "webmock"
  gem "vcr"
end

group :development, :test do
  gem "pry-byebug"
end
