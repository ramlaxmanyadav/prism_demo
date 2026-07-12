class Book < ApplicationRecord
  belongs_to :subject, optional: true

  validates :title, :author, :isbn, presence: true
  validates :isbn, uniqueness: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[id title isbn author subject_id published_on copies_count available created_at updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[subject]
  end
end
