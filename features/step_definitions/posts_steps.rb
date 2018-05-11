Given(/^I request jsonplaceholder (.*)$/) do |resource|
    http = Net::HTTP.new("jsonplaceholder.typicode.com", "80")
    get_url = Net::HTTP::Get.new(resource)
    @response = http.request(get_url)
end

Given(/^I expect response to have id (.*)$/) do |id|
  expect(@response.body).to have_content id
end
Then(/^Post with id (\d+) has title (.*)$/) do |id, title|
  expect(@response.body).to have_content title
end

