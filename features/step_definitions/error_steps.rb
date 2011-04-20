Then /^(?:|I )should see no errors(?: within "([^"]*)")?$/ do |selector|
	with_scope(selector) do
	  if page.respond_to? :should
	    page.should have_no_content('E_NOTICE')
	  else
	    assert page.has_no_content?('E_NOTICE')
	  end
	end
end
