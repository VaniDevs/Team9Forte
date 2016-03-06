class UserTask < ActiveRecord::Base
	enum skill_type: [ :applied, :accepted, :denied ]

	belongs_to :user, :foreign_key => "user_id"
	belongs_to :task, :foreign_key => "task_id"
end
