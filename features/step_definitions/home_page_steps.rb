Given(/^there is post$/) do
  FactoryGirl.create(:post)
end

When(/^I fill in comment fields$/) do
  fill_in 'comment[name]', with: 'Имя комментатора'
  fill_in 'comment[text]', with: 'Текст комментария'
end