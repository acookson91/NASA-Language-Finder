Given(/^I am on the home page$/) do
  visit root_path
end

Then(/^I should see Summary Title$/) do
  expect(page).to have_content('NASA Repo Summary')
end

Then(/^I should see repo title (\d+)A$/) do |arg1|
  expect(page).to have_content("Repo Name: " + arg1 + "A")
end

Then(/^I should see repo description$/) do
  expect(page).to have_content("Description: The API documentation for several NASA APIs.")
end

When(/^I click (\d+)A$/) do |arg1|
  click_link(arg1 + 'A')
end

Then(/^I should see repo title$/) do
  expect(page).to have_content('Repo 39A Summary')
end