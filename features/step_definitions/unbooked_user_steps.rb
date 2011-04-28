require 'digest/sha1'

Then /^(?:|I )should not be logged in$/ do
	with_scope("#userStatus a") do
		if page.respond_to? :should
			page.should have_content("Sign In")
		else
			assert page.has_content?("Sign In")
		end
	end
end

Then /^(?:|I )should be logged in$/ do
	with_scope("#userStatus a") do
		if page.respond_to? :should
			page.should have_content("My Details")
		else
			assert page.has_content?("My Details")
		end
	end
end

the_random_password = nil

When /^(?:|I )fill in "([^"]*)" with a random password(?: within "([^"]*)")?$/ do |field, selector|
	the_random_password = Digest::SHA1.hexdigest(Time.now.to_i.to_s)
	with_scope(selector) do
		fill_in(field, :with => the_random_password)
	end
end

When /^(?:|I )fill in "([^"]*)" with the random password(?: within "([^"]*)")?$/ do |field, selector|
	with_scope(selector) do
		fill_in(field, :with => the_random_password)
	end
end

When /^(?:|I )register and log in as a new vendor$/ do
	steps %Q{
		When I go to vendor registration
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
		Then I should get an email with the subject "Unbooked Vendor Registration"
		When I click the verification link in "Unbooked Vendor Registration"
		Then I delete all emails with the subject "Unbooked Vendor Registration"
		Then I should be logged in
	}
end

When /^(?:|I )log in as a vendor$/ do
	steps %Q{
		When I go to log in
		When I fill in the following:
			| Email    | behaviouraltest+vendor@wavedigital.com.au |
			| Password | password                                  |
		When I press "Login"
		Then I should be logged in
	}
end
