$ ->
  $('.delete_post').click ->
    if confirm('Вы уверены?')
      postId = this['id']
      $.ajax
        url: "/admin/posts/#{postId}"
        type: 'DELETE'
        success: (data) ->
          window.location.reload()
      true
    else
      false
