class CreateBadgeTasks < ActiveRecord::Migration
  def change
    create_table :badge_tasks do |t|
      t.belongs_to :badge, index: true
      t.belongs_to :task, index: true

      t.timestamps null: false
    end
  end
end
