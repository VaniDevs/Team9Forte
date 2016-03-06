class Course < ActiveRecord::Base
	enum skill_type: [ :applied, :accepted, :denied, :completed ]
	belongs_to :badge
end
