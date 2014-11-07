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

When(/^I fill in post content$/) do
  fill_in 'post[title]', with: 'new_title'
  fill_in 'post[text]', with: 'new_text'
end

Then(/^I should see post content$/) do
  page.should have_content('new_title')
  page.should have_content('new_text')
end

When(/^I fill in new post content$/) do
  fill_in 'post[title]', with: 'edited_title'
  fill_in 'post[text]', with: 'edited_text'
end

When(/^I should see edited post content$/) do
  page.should have_content('edited_title')
  page.should have_content('edited_text')
end

When(/^I confirm dialog$/) do
  page.driver.browser.switch_to.alert.accept
end