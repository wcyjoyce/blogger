class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :posts
      t.string :name
      t.string :comment
      t.timestamps
    end
  end
end
