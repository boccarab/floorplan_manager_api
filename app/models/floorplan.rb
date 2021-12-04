class Floorplan < ApplicationRecord
  include SetUid
  
  belongs_to :project

  mount_uploader :plan_image, FloorplanUploader

  before_validation :set_default_name, on: :create

  validates :name, presence: true
  validates :plan_image, presence: true

  def photo_url
    return {} if plan_image.file.nil?

    {
      original: plan_image.url,
      large: plan_image.url(:large),
      thumb: plan_image.url(:thumb)
    }
  end

  private

  def set_default_name
    self.name ||= plan_image.file.original_filename
  end
end
