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

    it "Can click on an interviewer to view their show page" do
      user_1 = create(:user)
      visit admin_users_path

      click_on "#{user_1.email}"

      expect(current_path).to eq(admin_user_path(user_1))
      expect(page).to have_content("#{user_1.first_name}")
      save_and_open_page
    end


  end
end
