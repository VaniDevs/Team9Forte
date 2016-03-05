class Badge < ActiveRecord::Base
	enum skill_type: [ :hard_skill, :soft_skill ]
end
