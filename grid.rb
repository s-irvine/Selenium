require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for(:remote,url: 'http://52.213.84.182:4444/wd/hub',desired_capabilities: :firefox)

for i in 0..5
   puts "Iteration number is #{i}"
   
   driver.get "http://google.com"
     
   element = driver.find_element :name => "q"
   element.send_keys "QA Consulting" 
   element.submit

   puts "Page title is #{driver.title}"
  
   wait = Selenium::WebDriver::Wait.new(:timeout => 10)
   wait.until { driver.title.downcase.start_with? "qa" }

   puts "Page title is #{driver.title}"
end
driver.quit
