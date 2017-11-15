Feature: Expenses
  In order to be able to track my expenses
  As a User
  I want to save expenses in the report

  Scenario: Save expenses to the report
    Given Navigate to the main page
    When Sign up as a user
    And Create a few expenses
    And Generate a report
    Then The report should be displayed
    Then The subtotal amount should be correct
