class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string  :author
      t.text    :review
      t.integer :rating, index:true
      t.integer :avg_rating
      t.bit     :fav, index: true
      t.timestamps
    end
  end
end
