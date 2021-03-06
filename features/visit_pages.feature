Feature: Visit Summary page
  I want to visit the summary page and see summary of repo info

Scenario: Visit the Summary page
  Given I am on the home page
  Then I should see Summary Title
  Then I should see successful connection 

Scenario: See Repo details
  Given I am on the home page
  Then I should see repo title 39A
  Then I should see repo description

  Scenario: Click repo link
    Given I am on the home page
    When I click 39A
    Then I should see repo title
    Then I should see languages used
    Then I should see language percentage

  Scenario: Click repo link with not language
    Given I am on the home page
    When I click Autodoc
    Then I should see repo title Autodoc
    Then I should see the repo empty
