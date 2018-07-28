# frozen_string_literal: true

module Eureka
  class Execute
    class << self
      def run
        exec command
      end

      def command
        "sh -c 'java -jar #{options}'"
      end

      def options
        %w[jar_path side_app_name eureka_url].map do |option|
          send(option)
        end.join(' ')
      end

      def jar_path
        Eureka.jar
      end

      def side_app_name
        "--side-app-name=#{Eureka.side_app_name}"
      end

      # http://eureka:8761/eureka/
      def eureka_url
        "--eureka-url=#{Eureka.eureka_url}"
      end
    end
  end
end
