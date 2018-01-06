require 'rails_helper'

RSpec.describe "As a registered HR Admin user" do
  let(:admin) { create(:admin_user)  }
  context "I can manage Interviewers" do
    scenario "I can view a list of all current Interviewers" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      users = create_list(:user, 5)

      visit admin_dashboard_path

        click_on "Manage Interviewers"
        expect(current_path).to eq(admin_users_path)


        expect(users.count).to eq(5)
    end

    it "I can click on an interviewer to view their show page" do
      user_1 = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_users_path

      click_on "#{user_1.email}"

      expect(current_path).to eq(admin_user_path(user_1))
      expect(page).to have_content("#{user_1.first_name}")

    end

    it "I can add a new Interviewer to the application" do
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
