require 'cucumber/formatter/unicode'
require 'capybara/cucumber'
require 'capybara/session'

TESTING_URL = 'http://google.com/' # website you're testing

Capybara.default_selector = :css
Capybara.default_driver = :selenium
Capybara.default_wait_time = 2 #When we testing AJAX, we can set a default wait time
Capybara.run_server = false #Whether start server when testing
Capybara.ignore_hidden_elements = true #Ignore hidden elements when testing, make helpful when you hide or show elements using javascript
Capybara.app_host = TESTING_URL


# Internet Explorer testing
# usage: $ IE=true cucumber features
# see http://www.johng.co.uk/2010/10/13/run_capybara_and_cucumber_features_in_internet_explorer_on_remote_windows/
# requires Java and selenium-server-standalone >= 2.0 (http://code.google.com/p/selenium/downloads/list)
if ENV['IE'] then
  Capybara.register_driver :selenium do |app|
    Capybara::Driver::Selenium.new(app,
      :browser => :remote,
      :url => "http://192.168.61.129:4444/wd/hub", # change IP to your remote Windows machine (or VM)
      :desired_capabilities => :internet_explorer)
  end
end