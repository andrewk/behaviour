When /^(?:|I )start a paypal test$/ do
	# Signing in to sandbox test user account avoids difficult AJAX during login
	steps %Q{
		When I go to paypal developer
		When I fill in the following:
			| Email Address | #{PAYPAL_DEVELOPER_USERNAME} |
			| Password | #{PAYPAL_DEVELOPER_PASSWORD} |
		When I press "Log In"
		When I sign into my test account
	}
end

When /^(?:|I )sign into my test account$/ do
	visit "https://www.sandbox.paypal.com/cgi-bin/webscr?_cmd=login_run&login_email=#{PAYPAL_TEST_USERNAME}"
	steps %Q{
		When I fill in the following:
			| login_password | #{PAYPAL_TEST_PASSWORD} |
		When I press "Log In"
	}
end

When /^(?:|I )complete a PayPal purchase$/ do
	steps %Q{
		When I fill in the following:
			| login_email | #{PAYPAL_TEST_USERNAME} |
			| login_password | #{PAYPAL_TEST_PASSWORD} |
		When I press "Log In"
		Then I should see "Review your information"
		When I press "Pay Now"
		Then I should see "Thanks for your order"
		When I press "Return to #{PAYPAL_STORE_NAME}"
		Then I should see "You Made A Payment"
		Then I should see "Your payment for $2.50 AUD has been completed"
	}
end

When /^(?:|I )cancel a PayPal purchase$/ do
	steps %Q{
		Then I press "Cancel and return to #{PAYPAL_STORE_NAME}."
	}
end

When /^(?:|I )end a paypal test$/ do
	steps %Q{
		When I go to paypal developer
		When I click "Log Out"
	}
end