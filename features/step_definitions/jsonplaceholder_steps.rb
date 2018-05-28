# Common step
Given(/^I request jsonplaceholder (.*)$/) do |resource|
    http = Net::HTTP.new("jsonplaceholder.typicode.com", "80")
    get_url = Net::HTTP::Get.new(resource) # test for merge
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


# POST request scenario
Given(/^I expect response to have id (\d+)$/) do |id|
  expect(@response.body).to have_content id
end

Given(/^I send POST request (.*) to jsonplaceholder with params:$/) do |resource, table|
  uri = URI.parse("http://jsonplaceholder.typicode.com#{resource}")

  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new(uri.path, { "Content-Type" => "text/json" })
  request.body = table.hashes.first.to_json
  @response = http.request(request)
end

Then(/^I expect to get (\d+) (.*) status$/) do |code, message|
  expect(@response.code.to_i).to eq(code)
  expect(@response.msg).to eq(message)
end

# PUT request scenario
Given(/^I send PUT request to jsonplaceholder (.*)$/) do |resource|
  uri = URI.parse("http://jsonplaceholder.typicode.com#{resource}")

  payload = IO.readlines("features/fixtures/put_req_payload.txt") # return value is array

  header = {
    "Content-Type" => "text/json"
  }

  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Put.new(uri.request_uri, header)
  request.body = payload.to_json
  @response = http.request(request)
end
