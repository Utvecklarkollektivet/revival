class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :excerpt
      t.string :content
      t.boolean :published
      t.datetime :published_at
			t.references :user
			t.string :slug

      t.timestamps
    end
		add_index :articles, :slug, :unique => true
  end
end
