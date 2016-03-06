class UserTask < ActiveRecord::Base
	include ActiveModel::Validations

	enum task_type: [ :applied, :accepted, :denied ]

	validates :user_id, uniqueness: true
	validates :task_id, uniqueness: true

	belongs_to :user, :foreign_key => "user_id"
	belongs_to :task, :foreign_key => "task_id"

	validate :user_has_met_task_requirements

	def user_has_met_task_requirements
		user_badges = UserBadge.select(:badge_id).where(user_id: self.user_id, badge_id: BadgeTask.select(:badge_id).where(task_id: self.task_id))
		badge_tasks = BadgeTask.select(:badge_id).where(task_id: self.task_id)

		if (user_badges.count != badge_tasks.count)
      errors.add(:user_id, 'User failed to meet requirements of task.')
    end
	end
end
