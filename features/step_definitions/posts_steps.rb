# Scenario 1

Given(/^I expect response to have id (.*)$/) do |id|
  expect(@response.body).to have_content id
end
Then(/^Post with id (\d+) has title (.*)$/) do |id, title|
  expect(@response.body).to have_content title
end

# Scenario 2
Given(/^I send post request jsonplaceholder (.*)$/) do |resource|
  uri = URI.parse("http://jsonplaceholder.typicode.com#{resource}")

  header = {
    'Content-Type': 'text/json'
  }
# Payload of POST request
  post = {post: {
      title: "This is a faked post created using POST request",
      body: "This faked post won't be created, but status code tells as he did.",
      userId: 1
   }
  }

  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new(uri.request_uri, header)
  request.body = post.to_json
  @response = http.request(request)
  binding.pry
end


Then(/^I expect to get (.*) Created status$/) do |status_code|
  expect(@response.code).to eq(status_code)
  binding.pry
end

Then(/^I send put request jsonplaceholder (.*)$/) do |resource|
  uri = URI.parse("http://jsonplaceholder.typicode.com#{resource}")

  header = {
    'Content-Type': 'text/json'
  }

  post = {post: {
      id: 101,
      title: "This is a faked post UPDATED using POST request",
      body: "This faked post won't be created, but status code tells as he did.",
      userId: 1
   }
  }

  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Put.new(uri.request_uri, header)
  request.body = post.to_json
  @response = http.request(request)
  binding.pry
end

