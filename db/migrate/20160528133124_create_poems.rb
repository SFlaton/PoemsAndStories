class CreatePoems < ActiveRecord::Migration
  def change
    create_table :poems do |t|
      t.string :title
      t.text :content
      t.text :methaphor
      t.date :publish_date
      t.references :author, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
