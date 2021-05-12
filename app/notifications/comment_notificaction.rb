# To deliver this notification:
#
# CommentNotificaction.with(comment: @comment).deliver_later(@comment.post.user)
# # notification = CommentNotificaction.with(comment: @comment)
# # notification.deliver(@comment.post.user)
# #CommentNotificaction.with(post: @post).deliver(@comment.post.user)

# class CommentNotificaction < Noticed::Base
#   # Add your delivery methods
#   #
#   deliver_by :database
#   deliver_by :action_cable
#   # deliver_by :email, mailer: "UserMailer"
#   # deliver_by :slack
#   # deliver_by :custom, class: "MyDeliveryMethod"

#   # Add required params
#   #
#   param :post

#   # Define helper methods to make rendering easier.
#   #
#   def message
#     t(".message")
#   end

#   def url
#     post_path(params[:post])
#   end
# end
