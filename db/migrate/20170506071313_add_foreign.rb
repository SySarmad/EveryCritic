class AddForeign < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :user, index:true, foreign_key:true
    add_reference :reviews, :movie, index:true, foreign_key:true
    add_reference :comments, :review, index:true, foreign_key:true
  end
end
