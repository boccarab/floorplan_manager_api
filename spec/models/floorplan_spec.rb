# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Floorplan do
  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }

  describe 'plan_image presence' do
    let(:floorplan) { build(:floorplan, project: project) }

    it 'returns false if the plan_image is missing' do
      expect(floorplan.valid?).to be false
      expect(floorplan.errors.find { |error| error.attribute['plan_image'] }).to be_present
    end
  end
  
  describe 'name presence' do
    let(:floorplan) { build(:floorplan, :with_image, name: '', project: project) }

    it 'returns false if the name is blank' do
      expect(floorplan.valid?).to be false
      expect(floorplan.errors.find { |error| error.attribute['name'] }).to be_present
    end
  end

  describe 'associations' do
    let(:other_project) { create(:project, user: user) }

    let!(:project_floorplans) { create_list(:floorplan, 2, :with_image, project: project) }
    let!(:other_project_floorplans) { create_list(:floorplan, 2, :with_image, project: other_project) }

    it 'returns the project\s floorplans' do
      expect(project.floorplan_ids).to match_array(project_floorplans.map(&:id))
    end
  end

  describe 'set_default_name' do
    let(:floorplan) { build(:floorplan, :with_image, name: nil, project: project) }

    it 'set the name based on the image name' do
      expect {
        floorplan.save!
      }.to change { floorplan.name }.from(nil).to('1.png')
    end
  end
end
