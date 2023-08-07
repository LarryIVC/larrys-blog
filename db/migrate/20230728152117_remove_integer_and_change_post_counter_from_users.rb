class RemoveIntegerAndChangePostCounterFromUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :post_counter, 'integer USING CAST(post_counter AS integer)'
  end
end
