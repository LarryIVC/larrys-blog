class RenameauhtorIdIncomments < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :auhtorId, :author_id
    rename_column :comments, :Text, :text
    rename_column :comments, :PostId, :post_id    
  end
end
