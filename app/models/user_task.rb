class UserTask < ActiveRecord::Base
	enum task_type: [ :applied, :accepted, :denied ]

	validates :user_id, uniqueness: true
	validates :task_id, uniqueness: true

	belongs_to :user, :foreign_key => "user_id"
	belongs_to :task, :foreign_key => "task_id"
end
