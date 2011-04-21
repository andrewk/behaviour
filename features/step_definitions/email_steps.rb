require "net/imap"

Then /^(?:|I )should get an email with the subject "([^"]*)"$/ do |subject|
	imap = Net::IMAP.new("imap.gmail.com", 993, true)
	imap.login("behaviouraltest@wavedigital.com.au", "fu11y$ick")
	imap.select("INBOX")
	if imap.search(["SUBJECT", subject]).empty?
		fail "Couldn't find email"
	end
	imap.logout()
	imap.disconnect() 
end

When /^(?:|I )click the verification link in "([^"]*)"$/ do |subject|
	imap = Net::IMAP.new("imap.gmail.com", 993, true)
	imap.login("behaviouraltest@wavedigital.com.au", "fu11y$ick")
	imap.select("INBOX")
	messageid = imap.search(["SUBJECT", subject]).last
	message = imap.fetch(messageid, 'RFC822')[0].attr['RFC822']
	imap.logout()
	imap.disconnect()
	url = message.match(/http:\/\/[^\/]+\/(info\/join\/success|register)\/\d+\/\w+/)[0];
	visit url
end

Then /^(?:|I )delete all emails with the subject "([^"]*)"$/ do |subject|
	imap = Net::IMAP.new("imap.gmail.com", 993, true)
	imap.login("behaviouraltest@wavedigital.com.au", "fu11y$ick")
	imap.select("INBOX")
	imap.search(["SUBJECT", subject]).each do |messageid|
		imap.store(messageid, "+FLAGS", [:Deleted])
	end
	imap.logout()
	imap.disconnect() 
end


the_random_email_address = nil

When /^(?:|I )fill in "([^"]*)" with a random email address(?: within "([^"]*)")?$/ do |field, selector|
	the_random_email_address = "behaviouraltest+" + Time.now.to_i.to_s + "@wavedigital.com.au"
	with_scope(selector) do
		fill_in(field, :with => the_random_email_address)
	end
end

When /^(?:|I )fill in "([^"]*)" with the random email address(?: within "([^"]*)")?$/ do |field, selector|
	with_scope(selector) do
		fill_in(field, :with => the_random_email_address)
	end
end