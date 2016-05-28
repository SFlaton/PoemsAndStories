class CreateTagsStories < ActiveRecord::Migration
  def change
    create_table :tags_stories do |t|
      t.integer :tag_id
      t.integer :short_story_id
      t.timestamps null: false
    end
  end
end
