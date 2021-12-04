# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'email presence' do
    let(:user) { build(:user, email: nil) }

    it 'returns false if the email is missing' do
      expect(user.valid?).to be false
      expect(user.errors.find { |error| error.attribute['email'] }).to be_present
    end
  end

  describe 'scope on uniqueness of email' do
    let!(:user) { create(:user, email: 'test@test.com') }
    let(:user2) { build(:user, email: 'test@test.com') }

    it 'prevents same email with same roles' do
      expect(user2.valid?).to be false
      expect(user2.errors.find { |error| error.attribute['email'] }).to be_present
    end
  end

  describe 'associations' do
    let(:user) { create(:user) }

    let!(:user_projects) { create_list(:project, 2, user: user) }
    let!(:other_projects) { create_list(:project, 2, user: create(:user)) }

    it 'returns the user\s projects' do
      expect(user.project_ids).to match_array(user_projects.map(&:id))
      expect(user.project_ids).to match_array(user_projects.map(&:id))
    end
  end
end
