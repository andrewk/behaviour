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
		When I fill in "Password" with a random password
		When I fill in the following:
			| Business Name | Wave Digital |
			| Suburb        | Collingwood  |
			| Postcode      | 3066         |
			| Country       | Australia    |
			| First Name    | Jonathan     |
			| Last Name     | Christmas    |
		
		
		When I press "Register"
		Then I should see no errors
		Then I should not be logged in
		Then I should see "A verification email has been sent"
		Then I should get an email with the subject "Unbooked Vendor Registration"
		
		When I click the verification link in "Unbooked Vendor Registration"
		Then I should see no errors
		Then I should be logged in
		Then I should see "Your email has been confirmed"
		Then I should see "Log Out"
		
		When I click "Log Out"
		Then I should see no errors
		Then I should not be logged in
		Then I should see "Sign In" within "#userStatus a"
		
		When I click "Sign In"
		Then I should see no errors
		Then I should not be logged in
		Then I should see the "loginForm" form
		When I fill in "Email" with the random email address
		When I fill in "Password" with the random password
		
		When I press "Login"
		Then I should see no errors
		Then I should be logged in

	Scenario: I want to register as a customer

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
		Then I should see "Register me"

		When I click "Register me"
		Then I should see no errors
		Then I should not be logged in
		Then I should see the "registerForm" form
		When I fill in "Email" with a random email address
		When I fill in "Create Password" with a random password

		When I press "Register"
		Then I should see no errors
		Then I should not be logged in
		Then I should see "we have sent a verification email"
		Then I should get an email with the subject "Unbooked User Registration"

		When I click the verification link in "Unbooked User Registration"
		Then I should see no errors
		Then I should be logged in
		Then I should see "Log Out"

		When I click "Log Out"
		Then I should see no errors
		Then I should not be logged in
		Then I should see "Sign In" within "#userStatus a"

		When I click "Sign In"
		Then I should see no errors
		Then I should not be logged in
		Then I should see the "loginForm" form
		When I fill in "Email" with the random email address
		When I fill in "Password" with the random password

		When I press "Login"
		Then I should see no errors
		Then I should be logged in