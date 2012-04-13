Given /^I am on The Google$/ do
  visit 'http://www.google.com/'
end

When /^(?:|I )Search for "([^\"]*)"$/ do |value|
  fill_in('q', :with => value)
end