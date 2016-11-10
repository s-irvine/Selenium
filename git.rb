#WORKS INTERMITTENTLY

require 'rubygems'
require 'selenium-webdriver'

start = Time.now

user = "s-irvine"
pass = "Ripcurl12"

for i in 1..3
  puts "Iteration number #{i}"
  
  driver = Selenium::WebDriver.for(:remote,url: 'http://52.48.17.19:4444//wd/hub',desired_capabilities: :firefox)
  driver.manage.timeouts.implicit_wait = 10

  driver.get "https://github.com/s-irvine/Selenium"

  puts "Page title is #{driver.title}"

  driver.find_element(:xpath, "/html/body/header/div/div/div/a[2]").click

  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  wait.until { driver.title.downcase.start_with? "sign" }
  
  #sleep(10)

  puts "Page title is #{driver.title}"
  
  driver.find_element(:id, "login_field").send_keys "#{user}"
  driver.find_element(:id, "password").send_keys "#{pass}"
  driver.find_element(:xpath, '//*[@id="login"]/form/div[4]/input[3]').click  

  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  wait.until { driver.title.downcase.start_with? "s-irvine" }
  
  #sleep(10)

  puts "Page title is #{driver.title}"
  
  driver.find_element(:xpath, '//*[@id="js-repo-pjax-container"]/div[2]/div[1]/div[5]/div[2]/form/button').click

  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  wait.until { driver.title.downcase.start_with? "new" }
  
  #sleep(10)

  puts "Page title is #{driver.title}"

  element = driver.find_element(:xpath, "//*[@id='js-repo-pjax-container']/div[2]/div[1]/div/form[2]/div[2]/input[1]") 
  element.send_keys "Test - #{i}" 
  element.submit
  
  #m=0
  
  #until  driver.title.downcase.start_with? "s-irvine" 
    
    driver.find_element(:id, "submit-file").click
    #sleep(0.5)
    #m=m+1
    
  #end
  
  #puts "Needed to try #{m} times(s) to commit the new file"
  
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  wait.until { driver.title.downcase.start_with? "s-irvine" }
  
  #sleep(10)

  puts "Page title is #{driver.title}"
  
  driver.quit
end

fin = Time.now
run = fin-start
puts "Test has completed in #{run} seconds!" 
