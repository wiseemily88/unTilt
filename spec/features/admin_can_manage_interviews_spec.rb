require "rails_helper"
RSpec.describe "As a registered HR Admin user" do
  let(:admin) { create(:admin_user)  }

  context "I can manage interviews" do
    scenario "I can see all closed and open interviews" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      interviews = create_list(:interview, 5)

      visit admin_dashboard_path

        click_on "Manage Interviewers"
        expect(current_path).to eq(admin_users_path)


        expect(users.count).to eq(5)
    end
  end
end  
