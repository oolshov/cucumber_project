When(/^I enter (.*) and (.*)$/) do |username, password|
  @session.fill_in('login_field', with: username)
  @session.fill_in('password', with: password)
end

When(/^Click on Sign in button$/) do
  @session.click_button('Sign in')
end

Then(/^I should see (.*) warning message$/) do |string|
  expect(@session.text).to include string
end
