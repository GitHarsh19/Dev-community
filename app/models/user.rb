class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  PROFILE_TITLE = [
    'Senior Ruby On Rails Developer',
    'Full Stack Ruby On Rails Developer',
    'Junior Full Stack Ruby On Rails Developer',
    'Senior Full Stack Ruby On Rails Developer',
    'Senior Java Developer',
    'Senior Frontend Developer',
    'Frontend Developer',
    'Applied Scientist I',
    'Devops Engineer',
    'Cloud Engineer',
    'Android Engineer',
    'QA Engineer',
    'Software Development Engineer',
    'Software Development Engineer II',
    'Software Development Engineer in Test',
    'Technical Architect',
    'Tech Lead',
    'Staff Software Engineer',
    'Associate Software Engineer',
    'Data Scientist',
    'Big Data Engineer',
    'Technical Support Engineer',
    'UI Engineer'
  ].freeze
end
