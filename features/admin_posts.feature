Feature:
  As admin
  I want to manage posts

  Background:
    Given there is admin

  Scenario: as guest I should not have permission to posts
    When I am on the admin page
    Then I should see "Sign in"
      And I should not see "Добавить пост"

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
    Then I should see "Signed out successfully."

  Scenario: I should be able to add new post
    Given I signed in as admin
      And I am on the admin page
    When I click on "Добавить пост"
    Then I should see "Добавление нового поста"

  Scenario: I should be able to create post
    Given I signed in as admin
      And I am on the new post page
    When I fill in post content
      And I press "Добавить"
    Then I should see "Добавить пост"
      And I should see post content

  Scenario: I should be able to edit post
    Given I signed in as admin
      And there is post
      And I am on the admin page
    When I click on "Редактировать"
    Then I should see "Редактирование поста"

  Scenario: I should be able to edit post
    Given I signed in as admin
      And there is post
      And I am on the last post editing page
    When I fill in new post content
      And I press "Сохранить"
    Then I should see "Добавить пост"
      And I should see edited post content

  @javascript
  Scenario: I should be able to delete post
    Given I signed in as admin
      And there is post
      And I am on the admin page
    When I click on "Удалить"
      And I confirm dialog
    Then I should see "Пост успешно удалён"
      And I should not see "title_ololo"