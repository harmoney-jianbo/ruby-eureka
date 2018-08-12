# frozen_string_literal: true

module Eureka
  class Execute
    class << self
      def run
        Dir.chdir(File.expand_path '../../..', __FILE__) do
          p command
          exec command
        end
      end

      def command
        "sh -c 'java -jar #{options}'"
      end

      def options
        %w[jar_path side_app_name eureka_url app_port sidecar_port instance_id].map do |option|
          send(option)
        end.select{ |option| !option.to_s.strip.empty? }.join(' ')
      end

      def jar_path
        Eureka.jar
      end

      def instance_id
        "--instance-id=#{Eureka.instance_id}" if Eureka.instance_id
      end

      def sidecar_port
        "--sidecar-port=#{Eureka.sidecar_port}"
      end

      def side_app_name
        "--side-app-name=#{Eureka.side_app_name}"
      end

      def app_port
        "--app-port=#{Eureka.app_port}"
      end

      # http://eureka:8761/eureka/
      def eureka_url
        "--eureka-url=#{File.join(Eureka.eureka_url, "")}"
      end
    end
  end
end
