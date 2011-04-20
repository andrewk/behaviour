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