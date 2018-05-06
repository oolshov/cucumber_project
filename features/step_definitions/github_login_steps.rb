When(/^I enter (.*) and (.*)$/) do |username, password|
  fill_in('login_field', with: username)
  fill_in('password', with: password)
end

When(/^Click on Sign in button$/) do
  click_button('Sign in')
end

Then(/^I should see (.*) warning message$/) do |string|
  expect(page.text).to include string
end
