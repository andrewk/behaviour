@demo
Feature: To search the internet for kittens
  As a 7 year old child
  I need the Googles
          
Scenario: Attempt Searching for Kittehs
  Given I am on The Google
  Then I should see "Google"
  When I Search for "Kittehs"
  Then I should see "Lolcats"