module NavigationHelpers
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
    end
  end
end

World(NavigationHelpers)
