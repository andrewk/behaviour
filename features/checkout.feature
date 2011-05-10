Feature: Streamlined Checkout Works

	Scenario: I can make my way to Checkout without being logged in
		When I start a behavioural test

		When I go to the sitepoint vendor
		Then I should see "show these listings"
		Then I should not see "hide these listings"

		When I click "show these listings"
		Then I should see "hide these listings"
		Then I should see "Advertisting on home page"
		Then I should see "2.50"
		Then I should see "Apr 01, 11:00am"
		Then I should see "Book it now!"
		
		When I click "Book it now!"
		Then I should see "About Advertisting on home page"

		When I press "Book It Now!"
		Then I should see "Payment Details"
		
		Then the "Email" field should contain ""
		Then the "Password" field should contain ""
		Then the "First Name" field should contain ""
		Then the "Last Name" field should contain ""
		Then the "Phone" field should contain ""
		
		Then I should see "Order Summary" within "#supportingContentCol"
		Then I should see "Advertisting on home page" within "#supportingContentCol"
		Then I should see "SitePoint" within "#supportingContentCol"
		Then I should see "Fri 01 Apr, 11:00am" within "#supportingContentCol"
		Then I should see "Sat 02 Apr, 11:00am" within "#supportingContentCol"
		
		Then I should see "Account Login"

	Scenario: I can make my way to Checkout when logged in
		When I start a behavioural test
		
		When I log in as a vendor
		
		When I go to the sitepoint vendor
		Then I should see "show these listings"
		Then I should not see "hide these listings"

		When I click "show these listings"
		Then I should see "hide these listings"
		Then I should see "Advertisting on home page"
		Then I should see "2.50"
		Then I should see "Apr 01, 11:00am"
		Then I should see "Book it now!"
		
		When I click "Book it now!"
		Then I should see "About Advertisting on home page"

		When I press "Book It Now!"
		Then I should see "Payment Details"

		Then the "First Name" field should contain "Jonathan"
		Then the "Last Name" field should contain "Christmas"
		Then the "Phone" field should contain ""
		
		Then I should see "Order Summary" within "#supportingContentCol"
		Then I should see "Advertisting on home page" within "#supportingContentCol"
		Then I should see "SitePoint" within "#supportingContentCol"
		Then I should see "Fri 01 Apr, 11:00am" within "#supportingContentCol"
		Then I should see "Sat 02 Apr, 11:00am" within "#supportingContentCol"
		
		Then I should not see "Account Login"
		
	Scenario: I make a Purchase without entering any details
		When I start a behavioural test
		When I check out a listing
		Then I press "Pay Now"
		
		Then I should see "Payment Details"
		Then I should see "Account Login"
		Then I should see "Payment Method is required" within "#mainContentSplit form"
		Then I should see "Email is required" within "#mainContentSplit form"
		Then I should see "Password is required" within "#mainContentSplit form"
		Then I should see "First Name is required" within "#mainContentSplit form"
		Then I should see "Last Name is required" within "#mainContentSplit form"
		Then I should see "Phone Number is required" within "#mainContentSplit form"
		
	Scenario: I make a Purchase without entering any details while logged in
		When I start a behavioural test
		When I log in as a vendor
		When I check out a listing
		Then I press "Pay Now"
		
		Then I should see "Payment Details"
		Then I should not see "Account Login"
		Then I should see "Payment Method is required" within "#mainContentSplit form"
		Then I should not see "Email is required" within "#mainContentSplit form"
		Then I should not see "Password is required" within "#mainContentSplit form"
		Then I should not see "First Name is required" within "#mainContentSplit form"
		Then I should not see "Last Name is required" within "#mainContentSplit form"
		Then I should see "Phone Number is required" within "#mainContentSplit form"
		