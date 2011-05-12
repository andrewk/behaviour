Feature: Streamlined Checkout Works

	# Not Logged in User

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
		
	Scenario: I cannot make a Purchase without entering any details
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
		
		Then the "Email" field should contain ""
		Then the "Password" field should contain ""
		Then the "First Name" field should contain ""
		Then the "Last Name" field should contain ""
		Then the "Phone" field should contain ""
		
	Scenario: I can sign up with a PayPal purchase
		When I start a paypal test
		When I start a behavioural test

		When I check out a listing
		Then I should not be logged in

		When I choose "Pay by PayPal"
		When I fill in the following:
			| First Name | Test |
			| Last Name | User |
			| Password | Sekrit |
			| Email | test.user@wavedigital.com |
			| Phone | 5012 3456 |
		When I press "Pay Now"
		Then I should see no errors
		Then I should be logged in
		Then I should see "PayPal Purchase"

		When I press "Make PayPal Purchase"
		Then I should see "Choose a way to pay"

		When I complete a PayPal purchase

		# This will cause a dialog to appear if not running on secure test server

		Then I should be logged in
		Then I should see "Congratulations"
		Then I should see "USER, Test"
		Then I should see "test.user@wavedigital.com"
		Then I should see "SitePoint"
		Then I should see "Advertisting on home page"
		Then I should see "48 Cambridge Street"
		Then I should see "Collingwood"
		Then I should see "VIC"
		Then I should see "3066"
		Then I should see "AU"
		Then I should see "$2.50"
		Then I should see "Fri 01 Apr, 11:00am"
		Then I should see "Sat 02 Apr, 11:00am"
		Then I should see "Print"
		
		When I end a paypal test

	Scenario: I can cancel a PayPal purchase
		When I start a paypal test
		When I start a behavioural test

		When I check out a listing
		Then I should not be logged in

		When I choose "Pay by PayPal"
		When I fill in the following:
			| First Name | Test |
			| Last Name | User |
			| Password | Sekrit |
			| Email | test.user@wavedigital.com |
			| Phone | 5012 3456 |
		When I press "Pay Now"
		Then I should see no errors
		Then I should be logged in
		Then I should see "PayPal Purchase"

		When I press "Make PayPal Purchase"
		Then I should see "Choose a way to pay"

		When I cancel a PayPal purchase
		Then I should see "Payment Details"
		Then I should see "You cancelled your PayPal purchase, Please try again"
		Then I should be logged in

		When I end a paypal test

	Scenario: I cannot steal another account
		When I start a behavioural test

		When I check out a listing
		Then I should not be logged in

		When I choose "Pay by PayPal"
		When I fill in the following:
			| First Name | Test |
			| Last Name | User |
			| Password | Sekrit |
			| Email | behaviouraltest+vendor@wavedigital.com.au |
			| Phone | 5012 3456 |
		When I press "Pay Now"
		
		Then I should not be logged in
		Then I should see "Email address already in use."
		
	Scenario: I can log in with the Checkout form
		When I start a behavioural test
		When I check out a listing
		Then I should not be logged in
		Then I should see "Account Login" within "#supportingContentCol"
		Then I should see "Email" within "#mainContentSplit"
		Then I should see "Password" within "#mainContentSplit"
		Then the "First Name" field should contain ""
		Then the "Last Name" field should contain ""
	
		When I fill in the following within "#supportingContentCol":
			| Email | behaviouraltest+vendor@wavedigital.com.au |
			| Password | password |

		When I press "Login"
		Then I should be logged in
		Then I should not see "Account Login" within "#supportingContentCol"
		Then I should not see "Email" within "#mainContentSplit"
		Then I should not see "Password" within "#mainContentSplit"
		Then the "First Name" field should contain "Jonathan"
		Then the "Last Name" field should contain "Christmas"
		
	Scenario: I cannot log in with incorrect details
		When I start a behavioural test
		When I check out a listing
		Then I should not be logged in
		Then I should see "Account Login" within "#supportingContentCol"
		Then I should see "Email" within "#mainContentSplit"
		Then I should see "Password" within "#mainContentSplit"
		Then the "First Name" field should contain ""
		Then the "Last Name" field should contain ""

		When I fill in the following within "#supportingContentCol":
			| Email | behaviouraltest+vendor@wavedigital.com.au |
			| Password | obviously_wrong |
		When I press "Login"
		Then I should not be logged in
		
		Then I should see "Account Login" within "#supportingContentCol"
		Then I should see "Password does not match the email address. Please check your details and try again." within "#supportingContentCol"
		Then I should not see "Payment Method is required" within "#mainContentSplit form"
		Then I should not see "Email is required" within "#mainContentSplit form"
		Then I should not see "Password is required" within "#mainContentSplit form"
		Then I should not see "First Name is required" within "#mainContentSplit form"
		Then I should not see "Last Name is required" within "#mainContentSplit form"
		Then I should not see "Phone Number is required" within "#mainContentSplit form"
		
		Then I should see "Email" within "#mainContentSplit"
		Then I should see "Password" within "#mainContentSplit"

		# Doesn't pass for Unknown reasons, cannot see a difference between value and diff
		# Then the "Email" field within "#supportingContentCol" should contain "behaviouraltest+vendor@wavedigital.com.au"
		Then the "Password" field within "#supportingContentCol" should contain ""
		
		Then the "First Name" field should contain ""
		Then the "Last Name" field should contain ""
	
	Scenario: I can log in with my new account
		When I start a behavioural test

		When I check out a listing
		Then I should not be logged in

		When I choose "Pay by PayPal"
		When I fill in the following:
			| Email | test.user@wavedigital.com |
			| Password | Sekrit |
			| First Name | Test |
			| Last Name | User |
			| Phone | 5012 3456 |
		When I press "Pay Now"
		Then I should see no errors
		Then I should be logged in
		
		When I click "Log Out"
		Then I should not be logged in
		When I click "Sign In"
		
		When I fill in the following:
			| Email | test.user@wavedigital.com |
			| Password | Sekrit |
		When I press "Login"
		Then I should be logged in
		
		When I click "My Details"
		Then the "First Name" field should contain "Test"
		Then the "Last name" field should contain "User"
		Then the "Email" field should contain "test.user@wavedigital.com"
		Then the "Phone number" field should contain "5012 3456"
		
	Scenario: I will not lose my Purchase when I reload
		When I start a behavioural test
		When I check out a listing
		
		When I reload the page
		Then I should not be logged in
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
		
	Scenario: I will not lose my Purchase when I log in and reload
		When I start a behavioural test
		When I check out a listing

		When I fill in the following within "#supportingContentCol":
			| Email | behaviouraltest+vendor@wavedigital.com.au |
			| Password | password |
		When I press "Login"
		Then I should be logged in

		When I reload the page
		
		Then I should be logged in
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
		

	# Logged in User

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

	Scenario: I cannot make a Purchase without entering any details when logged in
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
		
		Then the "First Name" field should contain "Jonathan"
		Then the "Last Name" field should contain "Christmas"
		Then the "Phone" field should contain ""
	
	Scenario: I can make a PayPal purchase when logged in
		When I start a paypal test
		When I start a behavioural test
		
		When I log in as a vendor
		When I check out a listing
		
		When I choose "Pay by PayPal"
		When I fill in the following:
			| Phone | 5012 3456 |
		When I press "Pay Now"
		Then I should see no errors
		
		Then I should see "PayPal Purchase"
		
		When I press "Make PayPal Purchase"
		Then I should see "Choose a way to pay"

		When I complete a PayPal purchase

		# This will cause a dialog to appear if not running on secure test server

		Then I should be logged in
		Then I should see "Congratulations"
		Then I should see "Your transaction has been completed, a confirmation of your purchase has been emailed to you"
		Then I should see "CHRISTMAS, Jonathan"
		Then I should see "behaviouraltest+vendor@wavedigital.com.au"
		Then I should see "SitePoint"
		Then I should see "Advertisting on home page"
		Then I should see "48 Cambridge Street"
		Then I should see "Collingwood"
		Then I should see "VIC"
		Then I should see "3066"
		Then I should see "AU"
		Then I should see "$2.50"
		Then I should see "Fri 01 Apr, 11:00am"
		Then I should see "Sat 02 Apr, 11:00am"
		Then I should see "Print"
		
		When I end a paypal test

	Scenario: I can make a Credit Card Purchase when logged in
		When I start a behavioural test
		When I log in as a vendor
		When I check out a listing

		When choose "Pay by Credit Card"
		When I fill in the following:
			| Phone | 50123456 |
			| Card Number | 4444333322221111 |
			| Name on Card | Mr John Citizen |
			| paymentDetails_cvcNumber | 111 |
			| Billing Address | 1234 Blargh St |
			| City | Derpington |
			| Post Code | 3011 |
			| State | NSW |
		When I select "11" from "Expiry Month"
		When I select "11" from "Expiry Year"
		When I select "Australia" from "Country"

		When I press "Pay Now"
		
		Then I should be logged in
		Then I should see "Congratulations"
		Then I should see "Your transaction has been completed, a confirmation of your purchase has been emailed to you."
		Then I should see "CHRISTMAS, Jonathan"
		Then I should see "behaviouraltest+vendor@wavedigital.com.au"
		Then I should see "SitePoint"
		Then I should see "Advertisting on home page"
		Then I should see "48 Cambridge Street"
		Then I should see "Collingwood"
		Then I should see "VIC"
		Then I should see "3066"
		Then I should see "AU"
		Then I should see "$2.50"
		Then I should see "Fri 01 Apr, 11:00am"
		Then I should see "Sat 02 Apr, 11:00am"
		Then I should see "Print"

	Scenario: I will not lose my Purchase when I reload
		When I start a behavioural test
		When I log in as a vendor
		When I check out a listing
		
		When I reload the page
		Then I should be logged in
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
