require "test_helper"

class EurekaTest < Minitest::Test
  def setup
    Eureka.reset
  end

  def test_that_it_has_a_version_number
    refute_nil ::Eureka::VERSION
  end

  def test_eureka_setup_block_yield_self
    Eureka.setup do |config|
      assert_equal Eureka, config
    end
  end

  def test_that_it_has_a_side_app_name
    Eureka.setup do |config|
      config.side_app_name = 'sidecar-app-name'
    end
    assert_equal Eureka.side_app_name, 'sidecar-app-name'
  end

  def test_that_it_has_a_eureka_url
    Eureka.setup do |config|
      config.eureka_url    = 'http://eureka:8761/eureka/'
    end
    assert_equal Eureka.eureka_url, 'http://eureka:8761/eureka/'
  end

  def test_default_jar
    assert_equal Eureka.jar, 'bin/sidecar-1.0.jar'
  end

  def test_custom_jar_path
    Eureka.setup do |config|
      config.jar    = 'another_bin/sidecar-1.0.jar'
    end
    assert_equal Eureka.jar, 'another_bin/sidecar-1.0.jar'
  end
end
