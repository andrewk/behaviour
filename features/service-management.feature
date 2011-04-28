@user @register
Feature: Users can manage services

	Scenario: I want to set up a new service
		
		When I start a behavioural test
		
		When I register and log in as a new vendor
		Then I should see "For Business"
		
		When I click "For Business"
		Then I should see no errors
		Then I should see "Describe Your Services"
		
		When I click "Describe Your Services"
		Then I should see no errors
		Then I should see "Terms of Use"
		Then I should see "I accept the standard terms of business"
		
		When I check "I accept the standard terms of business"
		When I press "Accept"
		Then I should see "There are currently no services set up"
		Then I should see "New Service"
		
		When I click "New Service"
		Then I should see "New Service"
		Then I should see "Save service"
		Then I should see the "servicesForm" form
		When I fill in the following:
			| Service Title          | Web Development |
			| Default Duration (min) | 120             |
			| Default Price ($)      | 1000            |
			| Primary Tag            | development     |
			| Description            | Lorem ipsum.    |
		
		When I press "Save service"
		Then I should see no errors
		Then I should see "Service successfully saved."
		Then I should see "Web Development"
		Then I should see "120 min"
		Then I should see "$1000.00"
		Then I should see "Edit"
		
	Scenario: I want to set up another service
		
		When I start a behavioural test
		
		When I log in as a vendor
		
		When I go to vendor services list
		Then I should see "New Service"

		When I click "New Service"
		Then I should see "New Service"
		Then I should see "Save service"
		Then I should see the "servicesForm" form
		When I fill in the following:
			| Service Title          | iOS Development |
			| Default Duration (min) | 240             |
			| Default Price ($)      | 4000            |
			| Primary Tag            | development     |
			| Secondary Tag(s)       | ipad iphone     |
			| Description            | Lorem ipsum.    |
		
		When I press "Save service"
		Then I should see no errors
		Then I should see "Service successfully saved."
		Then I should see "iOS Development"
		Then I should see "240 min"
		Then I should see "$4000.00"
		
	Scenario: I want to edit a service
		
		When I start a behavioural test
		
		When I log in as a vendor
		
		When I go to vendor services list
		Then I should see "Edit"
		
		When I click "Edit"
		Then I should see no errors
		# Then I should not see the "serviceLogo" element
		Then I should see "Save service"
		Then I should see the "servicesForm" form
		When I fill in the following:
			| Service Title          | iPad Development |
			| Default Duration (min) | 480              |
			| Default Price ($)      | 8000            |
			| Primary Tag            | development      |
			| Secondary Tag(s)       | ipad             |
			| Description            | Lorem ipsum.     |
		
		When I press "Save service"
		Then I should see no errors
		Then I should see "Service successfully saved."
		Then I should see "iPad Development"
		Then I should see "480 min"
		Then I should see "$8000.00"
		
	Scenario: I want to delete a service
		
		When I start a behavioural test
		
		When I log in as a vendor
		
		When I go to vendor services list
		Then I should see "Delete"
		
		When I click "Delete"
		Then I should see no errors
		Then I should see "Are you sure you want to delete"
		Then I should see the "deleteservice" form
		Then I should see "Delete *"
		
		When I press "Delete *"
		Then I should see no errors
		Then I should see "Service successfully deleted."
