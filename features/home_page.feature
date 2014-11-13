Feature:
  As a guest
  I want to see posts

  Scenario: Welcome page
    When I visit the home page
    Then I should see "Главная"

  Scenario: Browsing all posts on home page
    Given there is a few posts
    When I am on the home page
    Then I should see ten last posts on page
      And I should not see full post texts

  Scenario: Pagination
    Given there is a few posts
    When I am on the home page
    Then I should see paging

  Scenario: Page browsing
    Given there is a few posts
      And I am on the home page
    When I follow 3th page
    Then I should see ten first posts on page

  Scenario: Browsing post
    Given there is a post
      And I am on the home page
    When I click on first post title
    Then I should see full post content

  Scenario: Adding comment validate
    Given there is a post
      And I am on the existing post page
    When I press "Оставить комментарий"
    Then I should see "Во время добавления комментария произошла ошибка"
      And I should see "Необходимо указать Ваше имя"
      And I should see "Необходимо заполнить текст комментария"

  Scenario: Adding comments
    Given there is a post
      And I am on the existing post page
    When I fill in comment fields
      And I press "Оставить комментарий"
    Then I should see "Ваш комментарий добавлен"
      And I should see comment content

  Scenario: I should not see unpublished comment
    Given there is unpublished post
    When I am on the home page
    Then I should not see unpublished comment