
Given("I wait to debug") do
  binding.pry
end

# Scenario 2

Given("I launch {string}") do |string|
  @session.visit string
end

Given("I fill-in search with {string}") do |string|
  @session.find("#lst-ib").set string + "\n"
end

Then("I should see {string}") do |string|
  expect(@session.text).to include string
end

# Scenario 3

Given("I click on the first link in the results set") do
  @session.first('.r > a').click
  expect(@session.text).to include "What should I know?"
end
