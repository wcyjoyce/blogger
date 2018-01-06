class CreateUpvotes < ActiveRecord::Migration[5.1]
  def change
    create_table :upvotes do |t|
      t.references :post
      t.references :user
      t.boolean :upvote
      t.timestamps
    end
  end
end
