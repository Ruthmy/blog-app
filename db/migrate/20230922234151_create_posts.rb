class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :users, null: false, foreign_key: true
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
