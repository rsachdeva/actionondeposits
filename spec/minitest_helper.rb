begin
  ENV["RAILS_ENV"] ||= "test"
  require File.expand_path("../../config/environment", __FILE__)
  require 'simplecov'
  SimpleCov.start do
      add_filter '/spec/'
      add_filter '/vendor/'
     add_filter '/config/'
  end

  puts "Rails.env is #{Rails.env.inspect}"
  require 'minitest/spec'
  require 'minitest/autorun'
  require 'timecop'
  require 'database_cleaner'
  require 'turn'

  DatabaseCleaner.strategy = :truncation
  class MiniTest::Spec
    before :each do
      DatabaseCleaner.clean
    end
  end

  #class IntegrationTest < MiniTest::Spec
  #  include Rails.application.routes.url_helpers
  #  include Capybara::DSL
  #  register_spec_type(/integration$/, self)
  #end
  #
  #class HelperTest < MiniTest::Spec
  #  include ActiveSupport::Testing::SetupAndTeardown
  #  include ActionView::TestCase::Behavior
  #  register_spec_type(/Helper$/, self)
  #end

  Turn.config.format = :outline
rescue => e
  puts " e is #{e.backtrace}"
end

