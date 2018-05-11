Then(/^I expect response to have postId (\d+)$/) do |post_id|
  expect(@response.body).to have_content post_id
end

Then(/^I expect to get (.*) OK status$/) do |status|
  expect(@response.code).to eq(status)
end
