class EmployerTask < ActiveRecord::Base
	belongs_to :employer, :foreign_key => "employer_id"
	belongs_to :task, :foreign_key => "task_id"
end
