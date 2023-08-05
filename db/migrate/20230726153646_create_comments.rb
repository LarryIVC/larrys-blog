class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :auhtorId
      t.integer :PostId
      t.string :Text

      t.timestamps
    end

    # add_foreign_key :comments, :users, column: :authorId
    # add_foreign_key :comments, :posts, column: :PostId
  end
end
