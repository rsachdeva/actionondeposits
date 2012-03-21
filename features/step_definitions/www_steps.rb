Given /^I load maturing deposits page$/ do
  visit(deposits_path)
end

Then /^I should see "([^"]*)"$/ do |text|
  # capybara session methods with minitest spec matcher
  page.body.must_match(/#{text}/)
end

Then /^I should not see "([^"]*)"$/ do |text|
  # capybara session methods with minitest spec matcher
  page.body.wont_match(/#{text}/)
end

Then /^show me the page to debug$/ do
  page.save_and_open_page
end