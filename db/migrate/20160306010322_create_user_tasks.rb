class CreateUserTasks < ActiveRecord::Migration
  def change
    create_table :user_tasks do |t|
      t.belongs_to :user, index: true
      t.belongs_to :task, index: true
      t.integer :task_type, default: 0, null: false

      t.timestamps null: false
    end
  end
end
