require "rails_helper"
RSpec.describe "As a registered HR Admin user" do
  let(:admin) { create(:admin_user)  }

  context "I can create attribute for the interview templates" do
    scenario "I can see a list of all current company attributes" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      create_list(:attribute, 3)

      visit admin_dashboard_path
      attributes = Attribute.all

      expect(page).to have_content(attributes.last.name)
    end

    scenario "I can add a new attribute" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path

      click_on "Create a New Attribute"

      expect(current_path).to eq(new_admin_attribute_path)

      fill_in "attribute[name]", with: "Leadership"
      fill_in "attribute[description]", with: "The power or ability to lead other people"
      click_on 'Submit'

      new_attribute = Attribute.last

      expect(current_path).to eq(admin_dashboard_path)
      expect(page).to have_content(new_attribute.name)
      expect(page).to have_content(new_attribute.description)
    end

  end
end
