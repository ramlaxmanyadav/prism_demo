class Teacher < ApplicationRecord
  belongs_to :subject, optional: true
  has_many :students, dependent: :nullify

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  def name
    "#{first_name} #{last_name}"
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[id first_name last_name email phone subject_id hire_date salary active created_at updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[subject students]
  end
end
