require 'cucumber/formatter/unicode'
require 'capybara/cucumber'
require 'capybara/session'

REMOTE_IP = '192.168.61.129' # machine on your network you're using for browser testing (can be a Windows VM in OSX, etc)

Capybara.default_selector = :css
Capybara.default_driver = :selenium
Capybara.default_wait_time = 30 #When we testing AJAX, we can set a default wait time
Capybara.run_server = false #Whether start server when testing
Capybara.ignore_hidden_elements = true #Ignore hidden elements when testing, make helpful when you hide or show elements using javascript


# usage: $ BROWSER=ie cucumber features
# remote browsers require Java and selenium-server-standalone >= 2.0 on the remote browser host 
# (http://code.google.com/p/selenium/downloads/list) 
# java -jar selenium-server-standalone-2.0a7.jar

case ENV['BROWSER']
  when 'ff'
    Capybara.register_driver :selenium do |app|
      Capybara::Driver::Selenium.new(app,
        :browser => :firefox
    )
    end

  when 'chrome'
    Capybara.register_driver :selenium do |app|
      Capybara::Driver::Selenium.new(app,
        :browser => :chrome
    )
    end
    
  when 'ie'
    Capybara.register_driver :selenium do |app|
      Capybara::Driver::Selenium.new(app,
        :browser => :remote,
        :url => "http://"+REMOTE_IP+":4444/wd/hub", # change IP to your remote Windows machine (or VM)
        :desired_capabilities => :internet_explorer)
    end
    
  when 'ff-win'
    Capybara.register_driver :selenium do |app|
      Capybara::Driver::Selenium.new(app,
        :browser => :remote,
        :url => "http://"+REMOTE_IP+":4444/wd/hub", # change IP to your remote Windows machine (or VM)
        :desired_capabilities => :firefox)
    end
end