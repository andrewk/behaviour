@user @register
Feature: Users can manage locations

	Scenario: I want to set up a new location
		
		When I start a behavioural test
		
		When I register and log in as a new vendor
		Then I should see "For Business"
		
		When I click "For Business"
		Then I should see no errors
		Then I should see "List Your Available Time and Collect Your Money"
		
		When I click "List Your Available Time and Collect Your Money"
		Then I should see no errors
		Then I should see "Terms of Use"
		Then I should see "I accept the standard terms of business"
		
		When I check "I accept the standard terms of business"
		When I press "Accept"
		Then I should see "We notice you haven't set up any locations yet."
		Then I should see "Set your locations up first."
		
		When I click "Set your locations up first."
		Then I should see "Save location"
		Then I should see the "locationsForm" form
		When I fill in the following:
			| Location Title | Collingwood |
		
		When I press "Save location"
		Then I should see no errors
		Then I should see "Location created successfully."
		Then I should see "Collingwood"
		
	Scenario: I want to set up another location
		
		When I start a behavioural test
		
		When I log in as a vendor
		
		When I go to vendor locations list
		Then I should see "New Location"
	
		When I click "New Location"
		Then I should see "Save location"
		Then I should see the "locationsForm" form
		When I fill in the following:
			| Location Title | Osaka |
		
		When I press "Save location"
		Then I should see no errors
		Then I should see "Location created successfully."
		Then I should see "Osaka"
		
	Scenario: I want to edit a location
		
		When I start a behavioural test
		
		When I log in as a vendor
		
		When I go to vendor locations list
		Then I should see "Edit"
		
		When I click "Edit"
		Then I should see no errors
		Then I should see "Save location"
		Then I should see the "locationsForm" form
		When I fill in the following:
			| Location Title | New York |
		
		When I press "Save location"
		Then I should see no errors
		Then I should see "updated successfully."
		Then I should see "New York"
		
	Scenario: I want to delete a location
		
		When I start a behavioural test
		
		When I log in as a vendor
		
		When I go to vendor locations list
		Then I should see "Delete"
		
		When I click "Delete"
		# TODO: Fix so there is a prompt confirming deletion. (Lighthouse #206)
		# Then I should see no errors
		# Then I should see "Are you sure you want to delete"
		# Then I should see the "deletelocation" form
		# Then I should see "Delete *"
		# 
		# When I press "Delete *"
		Then I should see no errors
		Then I should see "Location deleted"
