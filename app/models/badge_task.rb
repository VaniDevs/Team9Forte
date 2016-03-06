class BadgeTask < ActiveRecord::Base
	belongs_to :badge, :foreign_key => "badge_id"
	belongs_to :task, :foreign_key => "task_id"
end
