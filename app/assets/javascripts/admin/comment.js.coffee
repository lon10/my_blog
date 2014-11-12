$ ->
  $('.delete_comment').click ->
    if confirm('Вы уверены?')
      commentId = this['id']
      $.ajax
        url: "/admin/posts/0/comments/#{commentId}"
        type: 'DELETE'
        success: (data) ->
          window.location.reload()
      true
    else
      false
