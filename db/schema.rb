# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170506084644) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "author"
    t.text "comment"
    t.integer "parent_id"
    t.integer "true"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "review_id"
    t.index ["review_id"], name: "index_comments_on_review_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "director"
    t.integer "avg_rating"
    t.integer "moviedb_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["avg_rating"], name: "index_movies_on_avg_rating"
    t.index ["moviedb_id"], name: "index_movies_on_moviedb_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "author"
    t.text "review"
    t.integer "rating"
    t.integer "avg_rating"
    t.bit "fav", limit: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "movie_id"
    t.index ["fav"], name: "index_reviews_on_fav"
    t.index ["movie_id"], name: "index_reviews_on_movie_id"
    t.index ["rating"], name: "index_reviews_on_rating"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_users_on_name"
  end

  add_foreign_key "comments", "reviews"
  add_foreign_key "reviews", "movies"
  add_foreign_key "reviews", "users"
end
