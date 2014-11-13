Given(/^there is a post$/) do
  FactoryGirl.create(:post)
end

Given(/^there is a few posts$/) do
  30.times do |index|
    FactoryGirl.create(:post,
                       title: "title_#{index}",
                       text: "<p>preview_#{index}</p><p>full_text_#{index}</p>"
    )
  end
end

When(/^I fill in comment fields$/) do
  fill_in 'comment[name]', with: 'Имя комментатора'
  fill_in 'comment[text]', with: 'Текст комментария'
end

When(/^I should see comment content$/) do
  page.should have_content('Имя комментатора')
  page.should have_content('Текст комментария')
end

When(/^I click on first post title$/) do
  click_link(Post.first.title)
end

When(/^I follow 3th page$/) do
  click_link('3')
end

Then(/^I should see full post content$/) do
  page.should have_content(Post.first.title)
  page.should have_content(Post.first.text)
end

Then(/^I should see ten last posts on page$/) do
  (20..29).each do |index|
    page.should have_content("title_#{index}")
    page.should have_content("preview_#{index}")
  end
end

Then(/^I should see ten first posts on page$/) do
  (0..9).each do |index|
    page.should have_content("title_#{index}")
    page.should have_content("preview_#{index}")
  end
end

Then(/^I should see ten first post titles on page$/) do
  (0..9).each do |index|
    page.should have_content("title_#{index}")
  end
end

Then(/^I should not see full post texts$/) do
  (20..29).each do |index|
    page.should_not have_content("full_text_#{index}")
  end
end

Then(/^I should see paging$/) do
  page.should have_content("1")
  page.should have_content("2")
  page.should have_content("3")
  page.should have_content("Дальше")
  page.should have_content("В конец")
end

Given(/^there is unpublished post$/) do
  FactoryGirl.create(:post, published: false)
end

Then(/^I should not see unpublished post/) do
  page.should_not have_content('title_ololo')
end