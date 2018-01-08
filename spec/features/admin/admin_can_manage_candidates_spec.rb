require "rails_helper"
RSpec.describe "As a registered HR Admin user" do
  let(:admin) { create(:admin_user)  }

  context "I can manage candidates" do
    scenario "I can see all candidates" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      create_list(:candidate, 5)

      visit admin_dashboard_path

      click_on "Manage Candidates"

      all_candidates = Candidate.all

      expect(current_path).to eq(admin_candidates_path)

      expect(all_candidates.count).to eq(5)
    end

    context "I can see candidate and interview details" do
      it "I can click on a candidate for the details" do
      candidate = create(:candidate)
      interviewer = create(:user)
      attribute_1 = create(:attribute)
      attribute_2 = create(:attribute)
      attribute_3 = create(:attribute)
      attribute_4 = create(:attribute)
      Interview.create!(date: "12/1/2018", candidate_id: candidate.id, user_id: interviewer.id, attribute_1: attribute_1, attribute_2: attribute_2, attribute_3: attribute_3, attribute_4: attribute_4)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_candidates_path


      click_on "Show Details"

      expect(current_path).to eq(admin_candidate_path(candidate))
      expect(page).to have_content("#{candidate.first_name}")
      expect(page).to have_content("#{candidate.last_name}")
      expect(page).to have_content("#{candidate.target_role}")
      expect(page).to have_content("#{candidate.interviews.first.date}")
      expect(page).to have_content("#{candidate.interviews.first.status}")
      expect(page).to have_content("#{candidate.interviews.first.user.first_name}")

    end
  end

    it "I can create a new Candidate" do

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_candidates_path

      click_on "Create a New Candidate"

      expect(current_path).to eq(new_admin_candidate_path)


      fill_in "candidate[first_name]", with: "Evan"
      fill_in "candidate[last_name]", with: "Xanthos"
      fill_in "candidate[target_role]", with: "Surgical PA"
      click_on 'Submit'

      new_candidate = Candidate.last

      expect(current_path).to eq(admin_candidates_path)
      expect(page).to have_content(new_candidate.first_name)
      expect(page).to have_content(new_candidate.last_name)
      expect(page).to have_content(new_candidate.target_role)
    end
  end
end
