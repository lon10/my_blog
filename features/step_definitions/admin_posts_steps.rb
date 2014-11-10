Given(/^there is admin$/) do
  FactoryGirl.create(:user, :with_admin_role)
end

Given(/^I signed in as admin$/) do
  login_as(User.last, scope: :user)
end

When(/^I fill in auth info$/) do
  fill_in 'user[email]', with: 'admin@example.com'
  fill_in 'user[password]', with: 'password'
end

When(/^I should see auth form$/) do
  page.should have_content('E-mail')
  page.should have_content('Пароль')
end

When(/^I fill in post content$/) do
  fill_in 'post[title]', with: 'new_title'
  fill_in_ckeditor 'post_text', :with => 'new_text'
end

When(/^I edit post content$/) do
  fill_in 'post[title]', with: 'edited_title'
  fill_in_ckeditor 'post_text', with: 'edited_text'
end

When(/^I erase post content$/) do
  fill_in 'post[title]', with: ''
  fill_in_ckeditor 'post_text', with: ''
end

When(/^I confirm dialog$/) do
  page.driver.browser.switch_to.alert.accept
end

When(/^I click on edit button$/) do
  page.find('.glyphicon-pencil').click()
end

When(/^I click on delete button$/) do
  page.find('.glyphicon-trash').click()
end

Then(/^created post should be correct$/) do
  post = Post.last
  expect(post.title).to eq('new_title')
  expect(post.text).to include('new_text')
end

Then(/^edited post should be correct$/) do
  post = Post.last
  expect(post.title).to eq('edited_title')
  expect(post.text).to include('edited_text')
end