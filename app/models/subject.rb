class Subject < ApplicationRecord
  has_many :books, dependent: :nullify
  has_many :teachers, dependent: :nullify
  has_many :student_subjects, dependent: :destroy
  has_many :students, through: :student_subjects

  validates :name, presence: true
  validates :code, presence: true, uniqueness: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[id name code description created_at updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[books teachers student_subjects students]
  end
end
