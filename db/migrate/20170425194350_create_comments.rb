class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :author
      t.string :comment_entry
      t.integer :blog_post_id

      t.timestamps
    end
  end
end
