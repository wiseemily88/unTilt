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

    it "I can click on an interview the details" do
      interview = create(:interview)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_interviews_path

      click_on "Show Details"

      expect(current_path).to eq(admin_interview_path(interview))
      expect(page).to have_content("#{interview.candidate.first_name}")

    end

    xit "I can create a new Interview" do
      candidate = create(:candidate)
      interviewers = create_list(:user,5)
      competencies = create_list(:competency, 4)

      interviewer_1_name = interviewers.last.first_name
      candidate_name = candidate.first_name

      attribute_1 = attributes.last.name
      attribute_2 = attributes.first.name
      attribute_3 = attributes[1].name
      attribute_4 = attributes[2].name


      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_interviews_path

      click_on "Create a New Interview"

      expect(current_path).to eq(new_admin_interview_path)


      fill_in "interview[date]", with: "12/1/2018"
      select "#{candidate_name}", :from => "interview_candidate_id"
      select "#{interviewer_1_name}", from: 'interview_user_id'
      select "#{attribute_1}", :from => "id_attribute[]"
      select "#{attribute_2}", :from => "id_attribute[]"
      select "#{attribute_3}", :from => "id_attribute[]"
      select "#{attribute_4}", :from => "id_attribute[]"

      click_on 'Submit'

      new_interview = Interview.last

      expect(current_path).to eq(admin_interviews_path)
      expect(page).to have_content(new_interview.date)
      expect(new_interview.status).to eq("open")

    end
  end
end
