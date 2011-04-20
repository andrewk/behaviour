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