class Student < ApplicationRecord
  belongs_to :teacher, optional: true
  has_many :student_subjects, dependent: :destroy
  has_many :subjects, through: :student_subjects

  validates :first_name, :last_name, :email, :enrollment_number, presence: true
  validates :email, uniqueness: true
  validates :enrollment_number, uniqueness: true

  def name
    "#{first_name} #{last_name}"
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[id first_name last_name email phone date_of_birth grade enrollment_number teacher_id active created_at updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[teacher student_subjects subjects]
  end
end
