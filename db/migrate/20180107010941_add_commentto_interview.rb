class AddCommenttoInterview < ActiveRecord::Migration[5.1]
  def change
    add_column :interviews, :comment, :text
  end
end
