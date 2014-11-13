Feature:
  As admin
  I want to manage posts

  Background:
    Given there is admin
      And I signed in as admin


  Scenario: Pagination
    Given there is a few posts
    When I am on the admin page
    Then I should see paging

  Scenario: Page browsing
    Given there is a few posts
      And I am on the admin page
    When I follow 3th page
    Then I should see ten first post titles on page

  Scenario: I should be able to add new post
    Given I am on the admin page
    When I click on "Добавить пост"
    Then I should see "Добавление нового поста"

  Scenario: New post creating validation
    Given I am on the new post page
    When I press "Сохранить"
    Then I should see "Во время создания поста произошла ошибка"
      And I should see "Необходимо ввести название"
      And I should see "Необходимо заполнить текст поста"

  @javascript
  Scenario: I should be able to create post
    Given I am on the new post page
    When I fill in post content
      And I press "Сохранить"
    Then I should see "Пост добавлен"
      And I should see "new_title"
      And created post should be correct

  @javascript
  Scenario: I should be able to edit post
    Given there is a post
      And I am on the admin page
    When I click on edit button
    Then I should see "Редактирование поста"

  @javascript
  Scenario: Edit post
    Given there is a post
      And I am on the last post editing page
    When I edit post content
      And I press "Сохранить"
    Then I should see "Пост отредактирован"
      And I should see "edited_title"
      And edited post should be correct

  @javascript
  Scenario: Edit post validation
    Given there is a post
      And I am on the last post editing page
    When I erase post content
      And I press "Сохранить"
    Then I should see "Во время редактирования поста произошла ошибка"
      And I should see "Необходимо ввести название"
      And I should see "Необходимо заполнить текст поста"

  @javascript
  Scenario: I should be able to delete post
    Given there is a post
      And I am on the admin page
    When I click on delete button
      And I confirm dialog
    Then I should see "Пост успешно удалён"
      And I should not see "title_ololo"

  @javascript
  Scenario: I should be able to preview post
    Given there is a post
      And I am on the admin page
    When I click on post preview button
    Then I should see post preview

  @javascript
  Scenario: I should be able to publish post
    Given there is unpublished post
      And I am on the admin page
    When I click on post publish button
    Then post should be published

  @javascript
  Scenario: I should be able to unpublish post
    Given there is a post
      And I am on the admin page
    When I click on post unpublish button
    Then post should be unpublished

