class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.integer :article_id
      t.integer :user_id

      t.timestamps
    end
  end
end
