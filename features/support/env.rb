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

Before do |scenario|
  p "This is before action because of tag @hello" if scenario.match_tags? "@hello"

  skip_this_scenario if scenario.match_tags? "@skip"
  @test_started = Time.now
end

#After do |scenario|
#  test_finished = Time.now
#  binding.pry
#  seconds = test_finished - @test_started
#  minutes = (seconds/60).to_i
#  seconds-=minutes*60
#  test_time =  "Scenario took: #{minutes} minute(s) and #{seconds.round(2)} seconds(s) to finish"
#  p test_time
#end

#def test_statistic
#end

def start_browser
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome
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

