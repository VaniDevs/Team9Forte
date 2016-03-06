class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer  :status, default: 0, null: false
      t.integer  :capacity, default: 0, null: false
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps null: false
      t.belongs_to :badge, index: true
    end
  end
end


# UserCourse
# t.integer :enrol_status, default: 0, null: false || needs applied, enrolled, denied, completed
