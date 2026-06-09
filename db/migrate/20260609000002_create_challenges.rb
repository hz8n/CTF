class CreateChallenges < ActiveRecord::Migration[7.1]
  def change
    create_table :challenges do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :category, null: false
      t.string :difficulty, null: false
      t.integer :points, null: false
      t.string :answer, null: false
      t.text :hint
      t.timestamps
    end
  end
end
