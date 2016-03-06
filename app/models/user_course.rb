class UserCourse < ActiveRecord::Base
	enum status: [ :applied, :accepted, :denied ]
	validates :user_id, uniqueness: true
	validates :course_id, uniqueness: true
	belongs_to :user, :foreign_key => "user_id"
	belongs_to :course, :foreign_key => "course_id"
end
