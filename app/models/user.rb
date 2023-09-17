class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  

  has_many :work_experiences, dependent: :destroy
  has_many :connections, dependent: :destroy

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
  def address
    "#{city}, #{state}, #{country}, #{pincode}"
  end
  def name
    "#{first_name} #{last_name}".strip
  end
  def self.ransackable_attributes(auth_object = nil)
    ['city', 'country']
  end
  def self.ransackable_associations(auth_object = nil)
    []
  end
  def check_if_already_connected?(current_user, user)
    current_user != user && !current_user.connections.pluck(:connected_user_id).include?(user.id)
  end
end
