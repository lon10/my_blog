Given(/^there is a comment$/) do
  post = Post.last

    FactoryGirl.create(:comment,
                       post: post
    )
end

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

Then(/^I should see all post comments$/) do
  page.should have_content('Комментарии к статье')

  comments = Comment.all
  comments.each do |comment|
    page.should have_content(comment.name)
    page.should have_content(comment.comment_preview)
  end
end

When(/^I click on edit post comments$/) do
  page.find('.glyphicon-comment').click
end

When(/^I delete comment$/) do
  page.find('.glyphicon-trash').click
end

Then(/^comment should be deleted$/) do
  page.should have_content('Комментарий успешно удалён')
  page.should have_content('К этой статье пока не добавлено ни одного комментария')
  page.should_not have_content('some_name')
  page.should_not have_content('some_text')

end

Then(/^I should see post count$/) do
  page.find('.comment-count').should have_content('5')

end