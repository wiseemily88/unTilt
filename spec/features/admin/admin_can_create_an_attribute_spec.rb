require "rails_helper"
RSpec.describe "As a registered HR Admin user" do
  let(:admin) { create(:admin_user)  }

  context "I can create competency for the interview templates" do
    scenario "I can see a list of all current company competencies" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      create_list(:competency, 3)

      visit admin_dashboard_path
      competencies = Competency.all

      expect(page).to have_content(competencies.last.name)
    end

    scenario "I can add a new attribute" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path

      click_on "Create a New Competency"

      expect(current_path).to eq(new_admin_competency_path)

      fill_in "competency[name]", with: "Leadership"
      fill_in "competency[description]", with: "The power or ability to lead other people"
      click_on 'Submit'

      new_competency = Competency.last

      expect(current_path).to eq(admin_dashboard_path)
      expect(page).to have_content(new_competency.name)
      expect(page).to have_content(new_competency.description)
    end

    scenario "I can edit an competency" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      competency = create(:competency)

      visit admin_dashboard_path
      expect(page).to have_content(competency.name)
      expect(page).to have_content(competency.description)

      click_on "Edit an Competency"

      expect(current_path).to eq(edit_admin_competency_path(competency))

      fill_in "competency[name]", with: "Communication"
      fill_in "competency[description]", with: "We like to talk here!"
      click_on "Submit"

      competency_updated = Competency.last

      expect(current_path).to eq(admin_dashboard_path)
      expect(competency_updated.name).to eq("Communication")
      expect(competency_updated.description).to eq("We like to talk here!")
    end
  end
end
