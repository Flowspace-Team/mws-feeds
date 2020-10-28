# frozen_string_literal: true

$: << File.expand_path("../../lib", __FILE__)

require "bundler/setup"
require "mws-feeds"

module FixtureHelpers
  def load_fixture(type)
    file = File.expand_path("../fixtures/#{type}.xml", __FILE__)
    File.read(file)
  end

  def load_xml_fixture(type)
    Nokogiri(load_fixture(type))
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.default_formatter = "doc"

  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include FixtureHelpers

  # Seed global randomization in this process using the `--seed` CLI option.
  # Setting this allows you to use `--seed` to deterministically reproduce
  # test failures related to randomization by passing the same `--seed` value
  # as the one that triggered the failure.
  Kernel.srand config.seed
end
