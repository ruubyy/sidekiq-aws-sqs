# frozen_string_literal: true

require_relative 'sqs/version'
require 'rails'
require 'aws-sdk'
require 'sidekiq'
require 'dry-configurable'

module Sidekiq
  module AWS
    module SQS
      extend Dry::Configurable

      setting :sqs_client, nil, reader: true
      setting :sqs_workers, [], reader: true
      setting :wait_time_seconds, 20, reader: true
      setting :max_number_of_messages, 10, reader: true
      setting :destroy_on_received, false, reader: true
      setting :message_attribute_names, [], reader: true
      setting :sqs_dt_available_event_types, [], reader: true
      setting :event_types, [], reader: true
      setting :dt_event_types, [], reader: true
      setting :logger, ::Sidekiq.logger, reader: true
    end
  end
end

require_relative 'sqs/rails/engine'
require_relative 'sqs/worker'
