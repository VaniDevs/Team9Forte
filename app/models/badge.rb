class Badge < ActiveRecord::Base
	enum skill_type: [ :hard_skill, :soft_skill ]

	has_many :user_badges
  has_many :users, through: :user_badges
end
