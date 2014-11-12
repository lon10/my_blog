Given(/^there is a few comments$/) do
  post = Post.last

  5.times do |index|
    FactoryGirl.create(:comment,
                       name: "name_#{index}",
                       text: "text_#{index}",
                       post: post
    )
  end
end

When(/^I click on edit post comments$/) do
  page.find('.glyphicon-comment').click()
end
