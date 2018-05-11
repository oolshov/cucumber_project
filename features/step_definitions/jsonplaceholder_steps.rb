# Common step
Given(/^I request jsonplaceholder (.*)$/) do |resource|
    http = Net::HTTP.new("jsonplaceholder.typicode.com", "80")
    get_url = Net::HTTP::Get.new(resource)
    @response = http.request(get_url)
end

# Users scenario
Given(/^I expect response to have text (.*)$/) do |string|
    expect(@response.body).to have_content string
  end


# Albums scenario
Then(/^I expect response to have userId (\d+)$/) do |user_id|
  expect(@response.body).to have_content user_id
end

Then(/^I expect response message (.*)$/) do |message|
  expect(@response.message).to eq(message)
end


# Comments scenario
Then(/^I expect response to have postId (\d+)$/) do |post_id|
  expect(@response.body).to have_content post_id
end

Then(/^I expect to get (.*) OK status$/) do |status_code|
  expect(@response.code).to eq(status_code)
end


# Photos scenario
Then(/^I expect get only photos from album (\d+)$/) do |album_id|
  expect(@response.body).to have_content album_id
end
