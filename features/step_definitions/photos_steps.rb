Then(/^I expect response to have only photos from album (\d+)$/) do |album_id|
    expect(@response.message).to include("OK")
  binding.pry
end
