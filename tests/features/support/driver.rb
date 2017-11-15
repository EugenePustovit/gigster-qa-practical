require 'capybara'
require 'capybara/dsl'


#Firefox
Capybara.register_driver :firefox do | app |
  Capybara::Selenium::Driver.new(app)
end

#Chrome
Capybara.register_driver :chrome do | app |
  Capybara::Selenium::Driver.new(app, browser: :chrome, driver_path: ENV['WEBDRIVER'] || '/usr/local/bin/chromedriver')
end

Capybara.default_max_wait_time = 10
Capybara.default_selector = :css

Capybara.default_driver = (ENV['DRIVER'] || :chrome).to_sym
Capybara.app_host = get_env_url
