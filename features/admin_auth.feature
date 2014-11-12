Feature:
  As admin
  I want to auth my self on admin page

  Background:
    Given there is admin

  Scenario: as guest I should not have permission to posts
    When I am on the admin page
    Then I should see auth form

  Scenario: I should be able to authorize
    Given I am on the auth page
    When I fill in auth info
      And I press "Войти"
    Then I should not see "Sign in"
      And I should see "Добавить пост"

  Scenario: I should be able to sign_out
    Given I signed in as admin
      And I am on the admin page
    When I click on "Выйти"
    Then I should see "Выход из системы выполнен успешно!"