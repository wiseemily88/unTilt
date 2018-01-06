require 'rails_helper'

RSpec.describe Candidate, type: :model do
  describe "validations" do
      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:last_name) }
      it { should validate_presence_of(:target_role) }
  end

  describe "relationships" do
    it "has many interviews" do
      interview = create(:interview)

    expect(interview).to respond_to(:candidate)
    end
  end

end
