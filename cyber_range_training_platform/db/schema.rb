ActiveRecord::Schema[7.1].define(version: 2026_06_09_000001) do
  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "role", default: "student", null: false
    t.integer "points", default: 0, null: false
    t.string "level", default: "Beginner", null: false
    t.timestamps
  end
  add_index "users", ["email"], unique: true

  create_table "challenges", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.string "category", null: false
    t.string "difficulty", null: false
    t.integer "points", null: false
    t.string "answer", null: false
    t.text "hint"
    t.timestamps
  end

  create_table "attempts", force: :cascade do |t|
    t.references "user", null: false, foreign_key: true
    t.references "challenge", null: false, foreign_key: true
    t.string "submitted_answer", null: false
    t.boolean "correct", default: false, null: false
    t.integer "points_awarded", default: 0, null: false
    t.timestamps
  end

  create_table "badges", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.string "icon", default: "🏅"
    t.timestamps
  end
  add_index "badges", ["name"], unique: true

  create_table "user_badges", force: :cascade do |t|
    t.references "user", null: false, foreign_key: true
    t.references "badge", null: false, foreign_key: true
    t.timestamps
  end
  add_index "user_badges", ["user_id", "badge_id"], unique: true
end
