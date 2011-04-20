Then /^(?:|I )should see no errors(?: within "([^"]*)")?$/ do |selector|
	with_scope(selector) do
		if page.respond_to? :should
			page.should have_no_content('E_NOTICE')
			page.should have_no_content('E_WARNING')
			page.should have_no_content('SMTP Error')
		else
			assert page.has_no_content?('E_NOTICE')
			assert page.has_no_content?('E_WARNING')
			assert page.has_no_content?('SMTP Error')
		end
	end
end
