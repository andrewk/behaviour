@demo
Feature: To search the internet for kittens
  As a 7 year old child
  I need the Googles
          
Scenario: Attempt "I'm Feeling Lucky" with no input
  Given I am on The Google
  Then I should see "Google"
  When I press "I'm Feeling Lucky"
  Then I should see "I'm Feeling LuckyTM"