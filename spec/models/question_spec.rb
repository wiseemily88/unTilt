require 'rails_helper'

RSpec.describe Question, type: :model do
  describe "relationships" do
      it { should belong_to(:competency) }
      it { should have_many(:interviews) }
      it { should have_many(:interview_questions) }
    end
end
