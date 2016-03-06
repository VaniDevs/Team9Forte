class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.string :address
      t.datetime :start_date, :default => DateTime.now
      t.datetime :end_date, :default => DateTime.now + (2*7*24*60*60)
      t.decimal :duration, default: 0

      t.timestamps null: false
    end
  end
end
