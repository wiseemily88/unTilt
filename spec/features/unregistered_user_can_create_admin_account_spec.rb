require 'rails_helper'

RSpec.describe "As an unregistered user" do
  scenario "I can create a new admin account" do
  visit new_user_path

  fill_in "user[email]", with: "admin@gamil.com"
  fill_in "user[password]", with: "password"
  fill_in "user[first_name]", with: "admin_1"
  fill_in "user[last_name]", with: "admin"
  fill_in "user[job_title]", with: "HR Business Partner"
  fill_in "user[department]", with: "People Operations"
  click_on 'Submit'

  admin = User.last

  expect(current_path).to eq(admin_dashboard_path)
  expect(page).to have_content("Welcome #{admin.email}")
  expect(admin.role).to eq("admin")
  expect(admin.role).to_not eq("interviewer")
  end
end
