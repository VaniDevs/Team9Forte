class CreateUserCourses < ActiveRecord::Migration
  def change
    create_table :user_courses do |t|
      t.belongs_to :user, index: true
      t.belongs_to :course, index: true
      t.integer :status, default: 0, null: false

      t.timestamps null: false
    end
  end
end
