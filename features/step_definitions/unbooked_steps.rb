When /^(?:|I )start a behavioural test$/ do
	steps %Q{
		When I go to fixture reset
		Then I should see no errors
		Then I should see "Import Fixtures"
		When I press "Import Fixtures"
		Then I should see no errors
		Then I should see "Fixtures have been imported."
	}
end

Then /^(?:|I )Debug$/ do
	print "Press Return to continue"
	STDIN.getc
end

Then /^(?:|I )Display "([^\"]*)"$/ do |message|
	print message
	print "Press Return to continue"
	STDIN.getc
end
