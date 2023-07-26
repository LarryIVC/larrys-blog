class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :auhtorId
      t.string :Title
      t.string :Text
      t.integer :CommentsCounter
      t.integer :LikesCounter

      t.timestamps
    end

    add_foreign_key :posts, :users, column: :auhtorId
    
  end
end
