When /^(?:|I )check out a listing$/ do
	steps %Q{
		When I go to the sitepoint vendor
		When I click "show these listings"
		When I click "Book it now!"
		When I press "Book It Now!"
		Then I should see "Payment Details"
	}
end
