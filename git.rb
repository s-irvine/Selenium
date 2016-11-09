require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for(:remote,url: 'http://52.213.84.182:4444/wd/hub',desired_capabilities: :firefox)
driver.manage.timeouts.implicit_wait = 5

driver.get "https://github.com/s-irvine/Selenium"

puts "Page title is #{driver.title}"

element = driver.find_element(:xpath, "//[@id='js-repo-pjax-container']/div[2]/div[1]/div[5]/div[2]/form/button")
puts "Element text is: #{element.text}"
element.click
#driver.find_element(:id, "Create new file").click 

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
wait.until { driver.title.downcase.start_with? "new" }

puts "Page title is #{driver.title}"

element = driver.find_element(:xpath, "//*[@id='js-repo-pjax-container']/div[2]/div[1]/div/form[2]/div[2]/input[1]") 
element.send_keys "test" 

driver.find_element(:xpath, "//*[@id='submit-file']").click
  
wait = Selenium::WebDriver::Wait.new(:timeout => 10)
wait.until { driver.title.downcase.start_with? "s-" }

puts "Page title is #{driver.title}"

driver.quit
