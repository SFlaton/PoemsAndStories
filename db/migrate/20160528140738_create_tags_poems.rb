class CreateTagsPoems < ActiveRecord::Migration
  def change
    create_table :tags_poems do |t|
        t.integer :tag_id
        t.integer :poem_id
        t.timestamps null: false
    end
  end
end
