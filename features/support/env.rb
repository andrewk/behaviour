require 'cucumber/formatter/unicode'
require 'capybara/cucumber'
require 'capybara/session'

Capybara.default_selector = :css
Capybara.default_driver = :selenium
Capybara.default_wait_time = 1 #When we testing AJAX, we can set a default wait time
Capybara.run_server = false #Whether start server when testing
Capybara.ignore_hidden_elements = true #Ignore hidden elements when testing, make helpful when you hide or show elements using javascript