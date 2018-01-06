class Candidate < ApplicationRecord
  has_many :interviews

  validates :first_name, :last_name, :target_role, presence: true
end
