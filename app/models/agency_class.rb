class AgencyClass < ActiveRecord::Base
	belongs_to :agency, :foreign_key => "agency_id"
	belongs_to :course, :foreign_key => "course_id"
end
