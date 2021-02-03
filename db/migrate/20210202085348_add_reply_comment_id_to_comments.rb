class AddReplyCommentIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :reply_comment_id, :integer
  end
end
