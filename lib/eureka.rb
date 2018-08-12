# frozen_string_literal: true

require 'eureka/railtie' if defined? Rails

module Eureka
  autoload :Execute, 'eureka/execute'
  autoload :Health, 'eureka/health'

  # Sidecar app name appear inside Euraka
  def self.side_app_name
    @side_app_name
  end

  def self.side_app_name=(side_app_name)
    @side_app_name = side_app_name
  end

  # Eureka URL
  def self.eureka_url
    @eureka_url
  end

  def self.eureka_url=(eureka_url)
    @eureka_url = eureka_url
  end

  # Eureka URL
  def self.jar
    @jar
  end

  def self.jar=(jar)
    @jar = jar
  end

  def self.app_port
    @app_port
  end

  def self.app_port=(app_port)
    @app_port = app_port
  end

  def self.sidecar_port
    @sidecar_port
  end

  def self.sidecar_port=(sidecar_port)
    @sidecar_port = sidecar_port
  end

  def self.instance_id
    @instance_id
  end

  def self.instance_id=(instance_id)
    @instance_id = instance_id
  end

  # Default way to set up Euraka
  def self.setup
    yield self
  end

  def self.reset
    @instance_id = nil
    @side_app_name = nil
    @eureka_url = nil
    @jar = 'bin/sidecar-1.0.jar'
    @app_port = 3000
    @sidecar_port = 9090
  end

  reset
end
