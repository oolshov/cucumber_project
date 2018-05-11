# Scenario 1
Given(/^I request jsonplaceholder (.*)$/) do |resource|
    http = Net::HTTP.new("jsonplaceholder.typicode.com", "80")
    get_url = Net::HTTP::Get.new(resource)
    @response = http.request(get_url)
    binding.pry
end

Given(/^I expect response to have id (.*)$/) do |id|
  expect(@response.body).to have_content id
end
Then(/^Post with id (\d+) has title (.*)$/) do |id, title|
  expect(@response.body).to have_content title
end

# Scenario 2
Given(/^I send post request jsonplaceholder (.*)$/) do |resource|
  uri = URI.parse("http://jsonplaceholder.typicode.com#{resource}")

  header = {'Content-Type': 'text/json'}
  post = {new_post: {userId: 1,
      title: "post created be post request 1",
      body: "I suppose this post would be created 1"
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

