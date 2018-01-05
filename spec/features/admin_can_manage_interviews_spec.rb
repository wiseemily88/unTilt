require "rails_helper"
RSpec.describe "As a registered HR Admin user" do
  let(:admin) { create(:admin_user)  }

  context "I can manage interviews" do
    scenario "I can see all closed and open interviews" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      create_list(:interview, 5)
      create(:completed_interview)

      visit admin_dashboard_path

      click_on "Manage Interviews"

      all_interviews = Interview.all

      expect(current_path).to eq(admin_interviews_path)
      expect(all_interviews.count).to eq(6)
    end
  end
end
