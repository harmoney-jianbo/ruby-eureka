# frozen_string_literal: true

module Eureka
  class Railtie < Rails::Railtie
    initializer 'ruby_eureka.health_check_initialization' do |app|
      app.middleware.insert_before Rack::Runtime, Eureka::Health
    end
  end
end
