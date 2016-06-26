Given(/^I am on the home page$/) do
  VCR.use_cassette('github-repos') do
    visit root_path
  end
end

Then(/^I should see Summary Title$/) do
  expect(page).to have_content('NASA Repo Summary')
end

Then(/^I should see repo title (\d+)A$/) do |arg1|
  expect(page).to have_content(arg1 + "a")
end

Then(/^I should see repo description$/) do
  expect(page).to have_content("Description: The API documentation for several NASA APIs.")
end

When(/^I click (\d+)A$/) do |arg1|
  VCR.use_cassette('github-repo-langs') do
    click_link(arg1 + 'a')
  end
end

Then(/^I should see repo title$/) do
  expect(page).to have_content('Repo 39A Summary')
end

Then(/^I should see languages used$/) do
  expect(page).to have_content('Repo 39A Summary')
  expect(page).to have_content('JavaScript')
end

Then(/^I should see language percentage$/) do
  expect(page).to have_content('JavaScript 45.28%')
end
