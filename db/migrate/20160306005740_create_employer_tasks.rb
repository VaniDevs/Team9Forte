class CreateEmployerTasks < ActiveRecord::Migration
  def change
    create_table :employer_tasks do |t|
      t.belongs_to :employer, index: true
      t.belongs_to :task, index: true

      t.timestamps null: false
    end
  end
end
