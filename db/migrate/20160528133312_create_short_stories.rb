class CreateShortStories < ActiveRecord::Migration
  def change
    create_table :short_stories do |t|
      t.string :title
      t.text :content
      t.text :description
      t.date :publish_date
      t.references :author, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
