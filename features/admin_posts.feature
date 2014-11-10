Feature:
  As admin
  I want to manage posts

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

  Scenario: Pagination
    Given I signed in as admin
      And there is a few posts
    When I am on the admin page
    Then I should see paging

  Scenario: Page browsing
    Given I signed in as admin
      And there is a few posts
      And I am on the admin page
    When I follow 3th page
    Then I should see ten first post titles on page

  Scenario: I should be able to add new post
    Given I signed in as admin
      And I am on the admin page
    When I click on "Добавить пост"
    Then I should see "Добавление нового поста"

  Scenario: New post creating validation
    Given I signed in as admin
      And I am on the new post page
    When I press "Сохранить"
    Then I should see "Необходимо ввести название"
      And I should see "Необходимо заполнить текст поста"
      And I should not see "Пост добавлен"

  @javascript
  Scenario: I should be able to create post
    Given I signed in as admin
      And I am on the new post page
    When I fill in post content
      And I press "Сохранить"
    Then I should see "Пост добавлен"
      And I should see "new_title"
      And created post should be correct

  @javascript
  Scenario: I should be able to edit post
    Given I signed in as admin
      And there is a post
      And I am on the admin page
    When I click on edit button
    Then I should see "Редактирование поста"

  @javascript
  Scenario: I should be able to edit post
    Given I signed in as admin
      And there is a post
      And I am on the last post editing page
    When I edit post content
      And I press "Сохранить"
    Then I should see "Пост отредактирован"
      And I should see "edited_title"
      And edited post should be correct

  @javascript
  Scenario: I should be able to delete post
    Given I signed in as admin
      And there is a post
      And I am on the admin page
    When I click on delete button
      And I confirm dialog
    Then I should see "Пост успешно удалён"
      And I should not see "title_ololo"