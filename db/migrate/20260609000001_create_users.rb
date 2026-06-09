class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :role, null: false, default: "student"
      t.integer :points, null: false, default: 0
      t.string :level, null: false, default: "Beginner"
      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
