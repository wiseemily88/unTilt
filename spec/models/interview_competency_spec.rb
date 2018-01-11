require 'rails_helper'

RSpec.describe InterviewCompetency, type: :model do


  describe "relationships" do
    it { should belong_to(:interview)}
    it { should belong_to(:competency) }
    end


end
