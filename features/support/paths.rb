# Put this into features/support and require it in your env.rb
#
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

      when /^the home\s?page$/
        root_path
      when /^the existing post\s?page$/
        home_post_path(Post.last)
      when /^the admin \s?page$/
        admin_path
      when /^the auth\s?page$/
        new_user_session_path
      when /^the new post\s?page$/
        new_admin_post_path
      when /^the last post editing\s?page$/
        edit_admin_post_path(Post.last)
      when /^the existing post comments edit\s?page$/
        admin_post_comments_path(Post.last)
      else
        begin
          page_name =~ /^the (.*) page$/
          path_components = $1.split(/\s+/)
          self.send(path_components.push('path').join('_').to_sym)
        rescue NoMethodError, ArgumentError
          raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
                    "Now, go and add a mapping in #{__FILE__}"
        end
    end
  end

end

World(NavigationHelpers)

