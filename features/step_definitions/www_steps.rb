Given /^I load maturing deposits page$/ do
  visit(deposits_path)
end

Then /^I should see "([^"]*)"$/ do |text|
  # capybara session methods
  page.body.must_match(/#{text}/m)
end