@user @register
Feature: Users can sign up

	Scenario: I want to register as a business
		
		When I go to the homepage
		Then I should see no errors
		Then I should not be logged in
		Then I should see "Sign In" within "#userStatus a"
		
		When I click "Sign In"
		Then I should see no errors
		Then I should not be logged in
		Then I should see "Get Started!"
		
		When I click "Get Started!"
		Then I should see no errors
		Then I should not be logged in
		Then I should see "Register my business"
		
		When I click "Register my business"
		Then I should see no errors
		Then I should not be logged in
		Then I should see the "vendorJoinForm" form
		When I fill in "Email" with a random email address
		When I fill in the following:
			| Business Name | Wave Digital                       |
			| Suburb        | Collingwood                        |
			| Postcode      | 3066                               |
			| Country       | Australia                          |
			| First Name    | Jonathan                           |
			| Last Name     | Christmas                          |
			| Password      | fu11y$ick                          |
		
		
		When I press "Register"
		Then I should see no errors
		Then I should not be logged in
		Then I should see "A verification email has been sent"
		Then I should get an email with the subject "Unbooked Vendor Registration"
		
		When I click the verification link
		Then I should see no errors
		Then I should see "Your email has been confirmed"
		Then I should be logged in
