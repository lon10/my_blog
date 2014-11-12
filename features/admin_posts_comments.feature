Feature:
  As admin
  I want to manage post comments

  Background:
    Given there is admin
      And there is a post
      And there is a few comments
      And I signed in as admin

  Scenario: I should be able to see all post comments
    Given I am on the admin page
    When I click on edit post comments
    Then I should see all post

  Scenario: I should be able to delete all post comments
    Given I am on the existing post comments delete page
    When I delete post
    Then post should be deleted
