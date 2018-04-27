
Given("I wait to debug") do
  binding.pry
end

Given("I launch {string}") do |string|
  @session.visit string
end

Given("I fill-in search with {string}") do |string|
  @session.find("#lst-ib").set string + "\n"
end

Then("I should see {string}") do |string|
  expect(@session.text).to include string
end