class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.integer :avg_rating, index: true
      t.integer :moviedb_id, index: true

      t.timestamps
    end
  end
end
