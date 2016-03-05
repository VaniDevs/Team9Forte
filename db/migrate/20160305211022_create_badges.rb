class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string  :name
      t.integer :skill_type, default: 0, null: false
      t.string  :description
      t.string  :image

      t.timestamps null: false
    end
  end
end
