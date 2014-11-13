Feature:
  As admin
  I want to manage post comments

  Background:
    Given there is admin
      And there is a post
      And I signed in as admin

  @javascript
  Scenario: I should be able to see all post comments
    Given there is a few comments
      And I am on the admin page
    When I click on edit post comments
    Then I should see all post comments

  @javascript
  Scenario: I should be able to delete all post comments
    Given there is a comment
      And I am on the existing post comments edit page
    When I delete comment
      And I confirm dialog
    Then comment should be deleted