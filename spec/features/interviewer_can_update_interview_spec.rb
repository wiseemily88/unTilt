require "rails_helper"


RSpec.describe "As a registered Interviewer" do
  let(:user) { create(:interviewer_with_multiple_upcoming_interviews)  }

  context "I can complete an open interview" do
    scenario "I can see a list of upcoming interviews " do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path

      click_on "Upcoming Interviews"
      interviews = user.interviews

      expect(current_path).to eq(interviews_path)
      expect(page).to have_content(interviews.first.date)
      expect(page).to have_content(interviews.first.candidate.first_name)
      expect(interviews.count).to have_content(3)
    end
  end
end
