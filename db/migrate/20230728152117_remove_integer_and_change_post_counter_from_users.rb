class RemoveIntegerAndChangePostCounterFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :integer, :string
    change_column :users, :post_counter, 'integer USING CAST(post_counter AS integer)'
  end
end
