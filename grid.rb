require 'rubygems'
require 'selenium-webdriver'

driver1 = Selenium::WebDriver.for(:remote,url: 'http://52.213.84.182:4444/wd/hub',desired_capabilities: :firefox)
driver2 = Selenium::WebDriver.for(:remote,url: 'http://52.213.84.182:4444/wd/hub',desired_capabilities: :firefox)
driver3 = Selenium::WebDriver.for(:remote,url: 'http://52.213.84.182:4444/wd/hub',desired_capabilities: :firefox)
driver4 = Selenium::WebDriver.for(:remote,url: 'http://52.213.84.182:4444/wd/hub',desired_capabilities: :firefox)

for i in 0..5
   puts "Iteration number #{i}"
   
   driver1.get "http://google.com"
     
   element = driver1.find_element :name => "q"
   element.send_keys "QA Consulting #{i}" 
   element.submit

   puts "Page title is #{driver1.title}"
  
   wait = Selenium::WebDriver::Wait.new(:timeout => 10)
   wait.until { driver1.title.downcase.start_with? "qa" }

   puts "Page title is #{driver1.title}"
end
driver1.quit

for i in 0..5
   puts "Iteration number #{i}"
   
   driver2.get "http://google.com"
     
   element = driver2.find_element :name => "q"
   element.send_keys "QA Consulting #{i}" 
   element.submit

   puts "Page title is #{driver2.title}"
  
   wait = Selenium::WebDriver::Wait.new(:timeout => 10)
   wait.until { driver2.title.downcase.start_with? "qa" }

   puts "Page title is #{driver2.title}"
end
driver2.quit

for i in 0..5
   puts "Iteration number #{i}"
   
   driver3.get "http://google.com"
     
   element = driver3.find_element :name => "q"
   element.send_keys "QA Consulting #{i}" 
   element.submit

   puts "Page title is #{driver3.title}"
  
   wait = Selenium::WebDriver::Wait.new(:timeout => 10)
   wait.until { driver3.title.downcase.start_with? "qa" }

   puts "Page title is #{driver3.title}"
end
driver3.quit

for i in 0..5
   puts "Iteration number #{i}"
   
   driver4.get "http://google.com"
     
   element = driver4.find_element :name => "q"
   element.send_keys "QA Consulting #{i}" 
   element.submit

   puts "Page title is #{driver4.title}"
  
   wait = Selenium::WebDriver::Wait.new(:timeout => 10)
   wait.until { driver4.title.downcase.start_with? "qa" }

   puts "Page title is #{driver4.title}"
end
driver4.quit
