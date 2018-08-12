require "test_helper"

class ExecuteTest < Minitest::Test
  def setup
    Eureka.reset
  end

  def test_options_without_instance_id
    Eureka.setup do |config|
      config.side_app_name    = 'my_test_name'
      config.eureka_url    = 'url'
      config.jar    = 'another_bin/sidecar-1.0.jar'
    end
    options = 'another_bin/sidecar-1.0.jar --side-app-name=my_test_name --eureka-url=url/ --app-port=3000 --sidecar-port=9090'
    assert_equal Eureka::Execute.options, options
  end


  def test_options_with_instance_id
    Eureka.setup do |config|
      config.side_app_name    = 'my_test_name'
      config.eureka_url    = 'url'
      config.jar    = 'another_bin/sidecar-1.0.jar'
      config.instance_id = 'service-a:9988'
    end
    assert_match /--instance-id=service-a:9988/, Eureka::Execute.options
  end

  def test_options_without_sidecar_port
    Eureka.setup do |config|
      config.side_app_name    = 'my_test_name'
      config.eureka_url    = 'url'
      config.jar    = 'another_bin/sidecar-1.0.jar'
    end
    options = 'another_bin/sidecar-1.0.jar --side-app-name=my_test_name --eureka-url=url/ --app-port=3000 --sidecar-port=9090'
    assert_equal Eureka::Execute.options, options
  end

  def test_options_with_sidecar_port
    Eureka.setup do |config|
      config.side_app_name    = 'my_test_name'
      config.eureka_url    = 'url'
      config.jar    = 'another_bin/sidecar-1.0.jar'
      config.app_port = 9999
      config.sidecar_port = 9099
    end
    options = 'another_bin/sidecar-1.0.jar --side-app-name=my_test_name --eureka-url=url/ --app-port=9999 --sidecar-port=9099'
    assert_equal Eureka::Execute.options, options
  end

  def test_options_without_app_port
    Eureka.setup do |config|
      config.side_app_name    = 'my_test_name'
      config.eureka_url    = 'url'
      config.jar    = 'another_bin/sidecar-1.0.jar'
    end
    options = 'another_bin/sidecar-1.0.jar --side-app-name=my_test_name --eureka-url=url/ --app-port=3000 --sidecar-port=9090'
    assert_equal Eureka::Execute.options, options
  end

  def test_options_with_app_port
    Eureka.setup do |config|
      config.side_app_name    = 'my_test_name'
      config.eureka_url    = 'url'
      config.jar    = 'another_bin/sidecar-1.0.jar'
      config.app_port = 9999
    end
    options = 'another_bin/sidecar-1.0.jar --side-app-name=my_test_name --eureka-url=url/ --app-port=9999 --sidecar-port=9090'
    assert_equal Eureka::Execute.options, options
  end

  def test_command
    Eureka.setup do |config|
      config.side_app_name    = 'my_test_name'
      config.eureka_url    = 'url'
      config.jar    = 'another_bin/sidecar-1.0.jar'
    end
    command = 'sh -c \'java -jar another_bin/sidecar-1.0.jar --side-app-name=my_test_name --eureka-url=url/ --app-port=3000 --sidecar-port=9090\''
    assert_equal Eureka::Execute.command, command
  end

  def test_side_app_name
    Eureka.setup do |config|
      config.side_app_name    = 'my_test_name'
    end
    assert_equal Eureka::Execute.side_app_name, '--side-app-name=my_test_name'
  end

  def test_eureka_url
    Eureka.setup do |config|
      config.eureka_url    = 'http://eureka:9999/eureka/'
    end
    assert_equal Eureka::Execute.eureka_url, '--eureka-url=http://eureka:9999/eureka/'
  end

  def test_eureka_url_with_trailing_slash
    Eureka.setup do |config|
      config.eureka_url    = 'http://eureka:9999/eureka'
    end
    assert_equal Eureka::Execute.eureka_url, '--eureka-url=http://eureka:9999/eureka/'
  end

  def test_default_jar_path
    assert_equal Eureka::Execute.jar_path, Eureka.jar
  end

  def test_custom_jar_path
    Eureka.setup do |config|
      config.jar    = 'another_bin/sidecar-1.0.jar'
    end
    assert_equal Eureka::Execute.jar_path, 'another_bin/sidecar-1.0.jar'
  end
end
