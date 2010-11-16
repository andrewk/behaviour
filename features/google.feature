@demo
Feature: To search the internet for kittens
  As a noob
  I need the Googles
          
Scenario: Google searches also return images
  Given I am on The Google
  Then I should see "Google"
  When I fill in "q" with "omg kittens"
  And I press "Google Search"
  Then I should see "Images for omg kittens"
    

