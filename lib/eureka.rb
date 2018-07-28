# frozen_string_literal: true

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

  # Default way to set up Euraka
  def self.setup
    yield self
  end

  def self.reset
    @side_app_name = nil
    @eureka_url = nil
    @jar = 'bin/sidecar-1.0.jar'
  end

  reset
end
