# frozen_string_literal: true

# config.middleware.use "Eureka::Health"
module Eureka
  class Health
    def initialize(app)
      @app = app
    end

    def call(env)
      @req = Rack::Request.new(env)
      if @req.path == '/health.json'
        [200, { 'Content-Type' => 'application/json' }, [ {status: 'UP'}.to_json ]]
      else
        @app.call(env)
      end
    end
  end
end
