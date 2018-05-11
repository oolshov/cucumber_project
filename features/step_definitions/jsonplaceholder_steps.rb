 Given(/^I expect response to have text (.*)$/) do |string|
    expect(@response.body).to have_content string
  end
