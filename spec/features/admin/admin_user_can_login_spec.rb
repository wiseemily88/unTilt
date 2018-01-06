require 'rails_helper'

RSpec.describe "As a registered HR Admin user" do
  let(:admin) { create(:admin_user)  }

  scenario "I can log in" do
    visit root_path

    fill_in "email", with: "#{admin.email}"
    fill_in "password", with: "#{admin.password}"
    click_on 'Login'

    expect(current_path).to eq(admin_dashboard_path)
  end

  scenario "I can log out" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path
    click_on 'Logout'

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Login")
  end

end
