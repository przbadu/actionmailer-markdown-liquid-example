class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :permalink
      t.text :content

      t.timestamps null: false
    end
  end
end
