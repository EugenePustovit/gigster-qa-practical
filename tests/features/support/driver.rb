require 'capybara'
require 'capybara/dsl'


#Firefox
Capybara.register_driver :firefox do | app |
  Capybara::Selenium::Driver.new(app)
end

#Chrome
Capybara.register_driver :chrome do | app |
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

#headless chrome
Capybara.register_driver :headless_chrome do | app |
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
      chromeOptions: { args: %w(headless disable-gpu) }
  )

  Capybara::Selenium::Driver.new app,
                                 browser: :chrome,
                                 desired_capabilities: capabilities
end

Capybara.default_max_wait_time = 10
Capybara.default_selector = :css

Capybara.default_driver = (ENV['DRIVER'] || :headless_chrome).to_sym
Capybara.app_host = get_env_url
