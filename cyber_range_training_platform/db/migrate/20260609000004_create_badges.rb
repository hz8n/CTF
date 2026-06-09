class CreateBadges < ActiveRecord::Migration[7.1]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :icon, default: "badge"
      t.timestamps
    end
    add_index :badges, :name, unique: true
  end
end
