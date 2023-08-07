class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.string :Title
      t.string :Text
      t.integer :CommentsCounter, default: 0
      t.integer :LikesCounter, default: 0

      t.timestamps
    end

    add_foreign_key :posts, :users, column: :author_id
    
  end
end
