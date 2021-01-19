class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :video_name, null: false
      t.string :video_url, null: false
      t.text :overview, null: false
      t.integer :genre_id, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
