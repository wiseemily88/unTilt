require 'rails_helper'

RSpec.describe Interview, type: :model do
  describe "validations" do
      it { should validate_presence_of(:date) }
  end

  describe "relationships" do
      it { should belong_to(:user) }
      it { should belong_to(:candidate) }
    end


end
