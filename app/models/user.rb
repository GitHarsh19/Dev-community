class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  

  has_many :work_experiences, dependent: :destroy
  has_many :connections, dependent: :destroy
  validates :first_name, :last_name, :profile_title, presence: true
  validates :username, presence: true, uniqueness: true

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
    return nil if city.blank? && state.blank? && country.blank? && pincode.blank?

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
  def my_connection(user)
    Connection.where("(user_id = ? AND connected_user_id = ?) OR (user_id = ? AND connected_user_id = ?)", user.id, id, self.id,user.id)
  end
  def check_if_already_connected?(user)
    self != user && !my_connection(user).present?
  end
  def mutually_connected_ids(user)
    self.connected_user_ids.intersection(user.connected_user_ids)
  end
end
