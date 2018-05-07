ENV['RACK_ENV'] = 'test'

require 'capybara/rspec'
require File.expand_path(File.dirname(__FILE__) + '/../main.rb')

# module RSpecMixin
#   include Rack::Test::Methods
#   def app
#     Main
#   end
# end

Capybara.app = Main

RSpec.configure do |config|

  config.include Rack::Test::Methods
  # config.include RSpecMixin

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
