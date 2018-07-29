require "test_helper"

class ExecuteTest < Minitest::Test
  def setup
    Eureka.reset
  end

  def test_options
    Eureka.setup do |config|
      config.side_app_name    = 'my_test_name'
      config.eureka_url    = 'url'
      config.jar    = 'another_bin/sidecar-1.0.jar'
    end
    options = 'another_bin/sidecar-1.0.jar --side-app-name=my_test_name --eureka-url=url/ --app-port=3000'
    assert_equal Eureka::Execute.options, options
  end

  def test_command
    Eureka.setup do |config|
      config.side_app_name    = 'my_test_name'
      config.eureka_url    = 'url'
      config.jar    = 'another_bin/sidecar-1.0.jar'
    end
    command = 'sh -c \'java -jar another_bin/sidecar-1.0.jar --side-app-name=my_test_name --eureka-url=url/ --app-port=3000\''
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
