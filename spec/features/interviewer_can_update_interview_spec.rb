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
      expect(page).to_not have_content("completed")
    end

    scenario "I can complete one open interview" do
      selected_interview = user.interviews.first
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit interviews_path

      click_on "#{selected_interview.id}"


      expect(current_path).to eq(edit_interview_path(selected_interview))
      save_and_open_page

      fill_in "interview[score]", with: 3
      fill_in "interview[comment]", with: "We should extend an offer. Fits the values."
      click_on 'Submit'
    end
  end
end
