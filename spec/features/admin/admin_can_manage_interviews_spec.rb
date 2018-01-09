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
      interview = create(:interview_with_competencies)
      competencies = interview.competencies
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_interviews_path

      click_on "Show Details"

      expect(current_path).to eq(admin_interview_path(interview))
      expect(page).to have_content("#{interview.candidate.first_name}")
      expect(page).to have_content("#{interview.user.first_name}")
      expect(page).to have_content("#{competencies.first.name}")
      expect(page).to have_content("#{interview.status}")


    end

    it "I can create a new Interview" do
      candidate = create(:candidate)
      interviewers = create_list(:user,5)
      competencies = create_list(:competency, 4)

      interviewer_1_name = interviewers.last.first_name
      candidate_name = candidate.first_name

      competency_1 = competencies.last.name
      competency_2 = competencies.first.name
      competency_3 = competencies[1].name
      competency_4 = competencies[2].name


      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_interviews_path

      click_on "Create a New Interview"

      expect(current_path).to eq(new_admin_interview_path)



      fill_in "interview[date]", with: "12/1/2018"
      select "#{candidate_name}", :from => "interview_candidate_id"
      select "#{interviewer_1_name}", from: 'interview_user_id'

      within('.checkbox') do
      find("input[type='checkbox'][id='#{competency_1}']").set(true)
      find("input[type='checkbox'][id='#{competency_2}']").set(true)
      find("input[type='checkbox'][id='#{competency_3}']").set(true)
      find("input[type='checkbox'][id='#{competency_4}']").set(true)
    end


      click_on 'Submit'

      new_interview = Interview.last

      expect(current_path).to eq(admin_interviews_path)
      expect(page).to have_content(new_interview.date)
      expect(new_interview.status).to eq("open")

    end

    scenario "I can edit an open interview" do
      interview = create(:interview_with_competencies)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      interviewers = create_list(:user,5)

      interviewer_2_name = interviewers.first.first_name

      visit admin_interview_path(interview)

      click_on "Edit"

      expect(current_path).to eq(edit_admin_interview_path(interview))

      fill_in "interview[date]", with: "2/4/2018"
      fill_in "interview[status]", with: "completed"
      select "#{interviewer_2_name}", from: 'interview_user_id'
      click_on 'Submit'

      expect(current_path).to eq(admin_interviews_path)
      expect(page).to have_content("2018-04-02")
      expect(page).to have_content("completed")
    end

  end
end
