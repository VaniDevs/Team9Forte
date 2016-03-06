class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_badges
  has_many :badges, through: :user_badges

  has_many :user_tasks
  has_many :tasks, through: :user_tasks

  has_many :user_courses
  has_many :courses, through: :user_courses
end
