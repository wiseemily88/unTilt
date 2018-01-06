require "rails_helper"
RSpec.describe "As a registered HR Admin user" do
  let(:admin) { create(:admin_user)  }

  context "I can manage candidates" do
    scenario "I can see all candidates" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      create_list(:candidate, 5)

      visit admin_dashboard_path

      click_on "Manage Candidates"

      all_candidates = Candidate.all

      expect(current_path).to eq(admin_candidates_path)

      expect(all_candidates.count).to eq(5)
    end

    it "I can click on a candidate for the details" do
      candidate = create(:candidate)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_candidates_path

      click_on "Show Details"

      expect(current_path).to eq(admin_candidate_path(candidate))
      expect(page).to have_content("#{candidate.first_name}")
      expect(page).to have_content("#{candidate.last_name}")
      expect(page).to have_content("#{candidate.target_role}")

    end

    xit "I can create a new Interview" do
      candidate = create(:candidate)
      interviewers = create_list(:user,5)
      interviewer_1_name = interviewers.last.first_name
      candidate_name = candidate.first_name

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_candidates_path

      click_on "Create a New Interview"

      expect(current_path).to eq(new_admin_interview_path)


      fill_in "interview[date]", with: "12/1/2018"
      select "#{candidate_name}", :from => "interview_candidate_id"
      select "#{interviewer_1_name}", from: 'interview_user_id'
      click_on 'Submit'

      new_interview = Interview.last

      expect(current_path).to eq(admin_interviews_path)
      expect(page).to have_content(new_interview.date)
      expect(new_interview.status).to eq("open")

    end


  end
end
