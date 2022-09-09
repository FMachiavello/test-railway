# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource '/api/orders',
             headers: :any,
             methods: %i[get post delete],
             expose: ['Authorization']
    resource '*',
             headers: :any,
             methods: %i[get post patch put],
             expose: ['Authorization']
  end
end
