  Given("I request jsonplaceholder with {string}") do |string|
    http = Net::HTTP.new("jsonplaceholder.typicode.com", "80")
    get_url = Net::HTTP::Get.new(string)
    @response = http.request(get_url)
  end

  Given("I expect response to have text {string}") do |string|
    expect(@response.body).to have_content string
  end