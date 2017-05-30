ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'

## Simple Coverage
SimpleCov::formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  ])
SimpleCov.start

## Capybara
require File.join(File.dirname(__FILE__), '..', 'bookmark_manager.rb')
Capybara.app = BookmarkManager
