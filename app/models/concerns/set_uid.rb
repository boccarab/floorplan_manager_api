module SetUid
  extend ActiveSupport::Concern
  include ActiveModel::Validations

  included do
    before_validation :set_uuid, on: :create
    validates :uuid, uniqueness: { case_sensitive: true }, presence: true
  end

  def set_uuid
    return if uuid.present?

    (self.uuid = SecureRandom.uuid) while uuid.blank? || self.class.exists?(uuid: uuid)
  end
end
