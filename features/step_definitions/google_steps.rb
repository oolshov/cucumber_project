require_relative "../pageObjects/google_page.rb"

Given("I wait to debug") do
  binding.pry
end

browser = Selenium::WebDriver.for :chrome
google_page = GooglePage.new(browser)

# Scenario 2

Given("I launch {string}") do |string|
  visit string
end

Given("I fill-in search with {string}") do |string|
  #find("#lst-ib").set string + "\n"
  google_page.search_bar.set string
end

Then("I should see {string}") do |string|
  expect(page.text).to include string
end

# Scenario 3

Given("I click on the first link in the results set") do
  page.first('.r a').click
  expect(page.text).to include "What should i know?"
end
