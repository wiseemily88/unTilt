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
      competencies = selected_interview.competencies

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit interviews_path

      click_on "Show Details for #{selected_interview.id}"

      expect(current_path).to eq(edit_interview_path(selected_interview))
      expect(page).to have_content(competencies.first.name)

      fill_in "interview[score]", with: 3
      fill_in "interview[comment]", with: "We should extend an offer. Fits the values."
      fill_in "interview[interview_competencies_attributes][0][competency_score]", with: 3
      fill_in "interview[interview_competencies_attributes][1][competency_score]", with: 2
      fill_in "interview[interview_competencies_attributes][2][competency_score]", with: 1
      click_on 'Submit'


      expect(current_path).to eq(interviews_path)
      expect(selected_interview.reload.score).to eq(3)
      expect(selected_interview.reload.comment).to eq("We should extend an offer. Fits the values.")
      expect(selected_interview.reload.status).to eq("completed")
      byebug
      expect(selected_interview.interview_competencies.first.reload.competency_score).to eq(3)
    end
  end
end
