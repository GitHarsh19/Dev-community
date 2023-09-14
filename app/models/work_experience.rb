class WorkExperience < ApplicationRecord
  
  EMPLOYMENT_TYPE = ['Full-time', 'Part-time', 'Self-employeed', 'Freelance', 'Trainee', 'Internship']
  LOCATION_TYPE = ['On-site', 'Hybrid', 'Remote']


  belongs_to :user
  validates :company, :start_date, :job_title, :location, presence: true

  validates :employment_type, presence: true, inclusion: { in: EMPLOYMENT_TYPE, message: 'Not A Valid Employment Type'}
  
  validates :location_type, presence: true, inclusion: { in: LOCATION_TYPE, message: 'Not A Valid Location Type' }
  
  validate :work_experience_last_date
  validate :presence_of_end_date
  validate :end_date_greater_than_start_date, if: :currently_not_working_here?

  def work_experience_last_date
    if end_date.present? && currently_working_here
      errors.add(:end_date, ' Must Be Blank If You Are Currently Working In This Company ')
    end
  end
  def presence_of_end_date
    if end_date.nil? && !currently_working_here
      errors.add(:end_date, 'Must Be Present If You Are Not Currently Working In This Company')
    end
  end
  def currently_not_working_here?
    !currently_working_here
  end
  def end_date_greater_than_start_date
    return if end_date.nil?
    if end_date < start_date
      errors.add(:end_date, 'It Must Be Greater Than Start Date')
    end
  end

end