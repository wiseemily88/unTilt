require 'rails_helper'

RSpec.describe "As a registered HR Admin user" do
 let(:admin) { create(:admin_user)  }

  it "I can log in" do
    visit root_path

    fill_in "email", with: "#{admin.email}"
    fill_in "password", with: "#{admin.password}"
    click_on 'Login'

    expect(current_path).to eq(admin_dashboard_path)
    
  end

 xit "I can log out" do
   login_user(admin.email, admin.password)
   click_on 'Logout'

   expect(current_path).to eq(root_path)
   expect(page).to have_content("Login")
 end

end
