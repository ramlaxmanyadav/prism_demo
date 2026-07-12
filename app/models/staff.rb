class Staff < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  def name
    "#{first_name} #{last_name}"
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[id first_name last_name email phone designation department hire_date salary active created_at updated_at]
  end
end
