require 'rubygems'
require 'cucumber'
require 'capybara'
require 'selenium-webdriver'
require 'selenium/webdriver/remote/http/curb'
require 'selenium/webdriver/remote/http/persistent'
require 'pry'

def initialize
  start_browser
end

Before('@hello') do |scenario|
  p "Test started at: #{@test_started = Time.now}"
  p "This is before ation because of tag @hello"
end

Before('@skip') do |scenario|
  p "Test skipped at: #{@test_started = Time.now}"
  p "This scenario won't be run as it's tagged with @skip tag"
  skip_this_scenario if scenario.match_tags? "@skip"
end

After('@hello or @skip or @failed') do |scenario|
  if scenario.failed?
	  p exception_msg = "[Cucumber Project: ] #{scenario.exception.message}"
  else
    test_statistic
  end
end

def test_statistic
  test_finished = Time.now
#  binding.pry
  total_seconds = (test_finished - @test_started).to_i
# floor and modulus allow to split out minutes and seconds to get more precise output
  minutes = (total_seconds / 60).floor
  seconds = total_seconds % 60
  p overal_time = "Scenario took: #{minutes} minute(s) and #{seconds} second(s) to finish"
end

def start_browser
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"args" => %w[--ignore-certificate-errors --start-maximized] })
  capabilities.platform = :WINDOWS
  Capybara.default_driver = :selenium

  Capybara.server_host = ENV['LOCAL_IP']
  Capybara.server_port = '3110'
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app,
      :browser => :remote,
      :url => "http://#{ENV['WIN_IP']}:4444/wd/hub",
      :desired_capabilities => capabilities)


  end
  @session = Capybara::Session.new(:selenium)
end

