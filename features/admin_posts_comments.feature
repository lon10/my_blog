@javascript
Feature:
  As admin
  I want to manage post comments

  Background:
    Given there is admin
      And there is a post
      And I signed in as admin

  Scenario: I should be able to see all post comments
    Given there is a few comments
      And I am on the admin page
    When I click on edit post comments
    Then I should see all post comments

  Scenario: I should see comments count near label
    Given there is a few comments
    When I am on the admin page
    Then I should see post count

  Scenario: I should be able to delete all post comments
    Given there is a comment
      And I am on the existing post comments edit page
    When I delete comment
    Then comment should be deleted

  Scenario: I should see error message when I'm an idiot
    Given there is a comment
      And I am on the existing post comments edit page
    When I do stupid things with comments
    Then I should see error
