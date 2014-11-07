Feature:
  As admin
  I want to manage posts

  Background:
    Given there is admin

  Scenario: Permission validate
    When I am on the admin page
    Then I should see "Sign in"
      And I should not see "Добавить пост"

  Scenario: Admin authorize
    Given I am on the auth page
    When I fill in auth info
      And I press "Войти"
    Then I should not see "Sign in"
      And I should see "Добавить пост"

