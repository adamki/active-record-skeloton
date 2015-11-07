ENV["RACK_ENV"] ||= "test"

require 'bundler'
Bundler.require

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'capybara'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation, {except: %w[public.schema_migrations]}  #there are different stragies for DB cleaner. 

Capybara.app = TaskManager
