class Course < ActiveRecord::Base
	# enum skill_type: [ :applied, :accepted, :denied, :completed ]
  enum status: [ :open, :closed ]
	belongs_to :badge
  belongs_to :agency

  has_many :agency_classes
  has_many :agencies, through: :agency_classes
end
