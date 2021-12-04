# frozen_string_literal: true

module ExceptionHandlerConcern
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      error = { title: 'Record not found', detail: e.message, code: "#{e.model.underscore}_not_found" }
      errors = [error]
      Rails.logger.error(e)

      render json: { errors: errors }, status: :not_found
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      errors = e.record.errors.full_messages.map { |message| { title: 'Invalid attribute', code: :invalid_attribute, detail: message } }
      Rails.logger.error(e)

      render json: { errors: errors }, status: :unprocessable_entity
    end

    rescue_from ActionController::ParameterMissing do |e|
      errors = [{ title: 'Missing parameter', code: :missing_parameter, detail: e.message }]
      Rails.logger.error(e)

      render json: { errors: errors }, status: :unprocessable_entity
    end

    rescue_from ArgumentError, ActiveModel::ForbiddenAttributesError do |e|
      errors = [{ title: 'Argument error', code: :argument_error, detail: e.message }]
      Rails.logger.error(e)

      render json: { errors: errors }, status: :unprocessable_entity
    end
  end
end
