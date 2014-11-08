Feature:
  As a guest
  I want to see posts

  Scenario: Welcome page
    When I visit the home page
    Then I should see "Мой блог"

  Scenario: Browsing all posts on home page
    Given there is post
    When I am on the home page
    Then I should see "title_ololo"

  Scenario: Browsing post
    Given there is post
      And I am on the home page
    When I click on "title_ololo"
    Then I should see "title_ololo"
      And I should see "text_ololo"

  Scenario: Adding comments
    Given there is post
      And I am on the existing post page
    When I fill in comment fields
      And I press "Оставить комментарий"
    Then I should see "Имя комментатора"
      And I should see "Текст комментария"