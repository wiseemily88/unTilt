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

    xit "I can add a new Interviewer to the application" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_users_path

      click_on "Add a New Interviewer"

      expect(current_path).to eq(new_admin_user_path)

      fill_in "user[email]", with: "EvanX@gamil.com"
      fill_in "user[password]", with: "password"
      fill_in "user[first_name]", with: "Evan"
      fill_in "user[last_name]", with: "Xanthos"
      fill_in "user[job_title]", with: "Technical Manager"
      fill_in "user[department]", with: "Research and Development"
      click_on 'Submit'



      new_user = User.last

      expect(current_path).to eq(admin_users_path)
      expect(page).to have_content(new_user.first_name)
      expect(new_user.role).to eq("interviewer")
      expect(new_user.role).to_not eq("admin")
    end


  end
end
