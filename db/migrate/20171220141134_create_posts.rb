class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :users
      t.string :title
      t.text :content
      t.string :photo
      t.timestamps
    end
  end
end
