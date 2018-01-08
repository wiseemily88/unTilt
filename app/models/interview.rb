class Interview < ApplicationRecord
  # after_create :send_email_to_interviewers
  belongs_to :attribute_1, :class_name => "Attribute"
  belongs_to :attribute_2, :class_name => "Attribute"
  belongs_to :attribute_3, :class_name => "Attribute"
  belongs_to :attribute_4, :class_name => "Attribute"
  belongs_to :user
  belongs_to :candidate

  enum status: ["open", "completed"]

  validates :date, presence: true

   scope :open, -> { where(status: 0)}
   scope :completed, -> { where(status: 1)}


 # def send_email_to_interviewers(interviewer, interview)
 #   byebug
 #  InterviewNotifier.inform(interviewer, interview, interviewer.email).deliver_now
 # end
end
