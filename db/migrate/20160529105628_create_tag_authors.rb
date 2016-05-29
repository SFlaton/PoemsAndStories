class CreateTagsAuthors < ActiveRecord::Migration
  def change
    create_table :tags_authors do |t|
      t.integer :tag_id
      t.integer :author_id
      t.timestamps null: false
    end
  end
end
