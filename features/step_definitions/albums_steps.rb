Then(/^I expect response to have userId (\d+)$/) do |user_id|
  expect(@response.body).to have_content user_id
end

Then(/^I expect response to have response message (.*)$/) do |message|
  expect(@response.message).to eq(message)
end
