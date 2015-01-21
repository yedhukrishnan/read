class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.text :url
      t.integer :votes

      t.timestamps
    end
  end
end
