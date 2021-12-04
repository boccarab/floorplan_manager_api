# frozen_string_literal: true

FactoryBot.define do
  factory :floorplan do
    name { FFaker::CheesyLingo.title }

    trait :with_image do
      plan_image do
        Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'floorplans', '1.png'), 'image/png')
      end
    end
  end
end
