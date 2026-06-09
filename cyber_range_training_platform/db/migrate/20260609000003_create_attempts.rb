class CreateAttempts < ActiveRecord::Migration[7.1]
  def change
    create_table :attempts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :challenge, null: false, foreign_key: true
      t.string :submitted_answer, null: false
      t.boolean :correct, null: false, default: false
      t.integer :points_awarded, null: false, default: 0
      t.timestamps
    end
  end
end
