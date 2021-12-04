# frozen_string_literal: true

CarrierWave.configure do |config|
    if Rails.env.development? || Rails.env.test?
      config.storage = :file
      config.asset_host = Rails.application.routes.default_url_options[:host]
      config.enable_processing = Rails.env.development?
    else
      # TODO: Add config for production here
    end
  end
  