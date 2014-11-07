Given(/^there is admin$/) do
  FactoryGirl.create(:user, :with_admin_role)
end

When(/^I fill in auth info$/) do
  fill_in 'user[email]', with: 'admin@example.com'
  fill_in 'user[password]', with: 'password'
end