# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project do
  describe 'name presence' do
    let(:project) { build(:project, name: nil) }

    it 'returns false if the name is missing' do
      expect(project.valid?).to be false
      expect(project.errors.find { |error| error.attribute['name'] }).to be_present
    end
  end

  describe 'associations' do
    let(:user) { create(:user) }

    let!(:user_projects) { create_list(:project, 2, user: user) }
    let!(:other_projects) { create_list(:project, 2, user: create(:user)) }

    it 'returns the user\s projects' do
      expect(user.project_ids).to match_array(user_projects.map(&:id))
    end
  end
end
