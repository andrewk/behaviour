@search
Feature: Things can be found via search

	Scenario: Searching for an organistation
		
		When I start a behavioural test
		
		When I go to the homepage
		Then I should see no errors
		Then I should see the "searchForm" form
		
		When I fill in the following:
			| q | Wave Digital |
		When I press "Go"
		Then I should see no errors
		Then I should see "Search Results"
		Then I should see "Wave Digital"
		Then I should not see "SitePoint"
		
		When I click "Wave Digital"
		Then I should see no errors
		Then I should see "Wave Digital"
		
	Scenario: Searching for a service

		When I start a behavioural test

		When I go to the homepage
		Then I should see no errors
		Then I should see the "searchForm" form

		When I fill in the following:
			| q | iOS Development |
		When I press "Go"
		Then I should see no errors
		Then I should see "Search Results"
		Then I should see "Wave Digital"
		Then I should not see "SitePoint"

		When I click "Wave Digital"
		Then I should see no errors
		Then I should see "Wave Digital"
	
