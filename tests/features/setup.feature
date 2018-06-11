@api
Feature: Setup
  In order to be able to use the demo profile
  As a developer
  I want to make sure that everything is installed properly

  Scenario: The site is installed

    Given I am on the homepage
    Then I should see "Welcome to OpenEuropa"
