require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for(:remote,url: 'http://52.48.17.19:4444/wd/hub',desired_capabilities: :firefox)

for i in 0..10
   puts "Iteration number #{i}"
   
   driver.get "http://google.com"
     
   element = driver.find_element :name => "q"
   element.send_keys "Number #{i}" 
   element.submit

   puts "Page title is #{driver.title}"
  
   wait = Selenium::WebDriver::Wait.new(:timeout => 10)
   wait.until { driver.title.downcase.start_with? "num" }

   puts "Page title is #{driver.title}"
end
driver.quit
