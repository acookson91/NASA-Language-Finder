Feature: Visit Summary page
  I want to visit the summary page and see summary of repo info

Scenario: Visit the Summary page
  Given I am on the home page
  Then I should see Summary Title

Scenario: See Repo details
  Given I am on the home page
  Then I should see repo title 39A
  Then I should see repo description

  Scenario: Click repo link
    Given I am on the home page
    When I click 39A
    Then I should see repo title
