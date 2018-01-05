class Interview < ApplicationRecord
  belongs_to :user
  belongs_to :candidate

  enum status: ["open", "completed"]

  validates :date, presence: true
end
