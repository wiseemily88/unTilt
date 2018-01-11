require 'rails_helper'

RSpec.describe InterviewQuestion, type: :model do
        it { should belong_to(:question) }
        it { should belong_to(:interview) }

end
