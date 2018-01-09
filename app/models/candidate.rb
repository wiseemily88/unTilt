class Candidate < ApplicationRecord
  has_many :interviews
  accepts_nested_attributes_for :interviews

  validates :first_name, :last_name, :target_role, presence: true
end
