require 'rubygems'
require 'selenium-webdriver'

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
  
  k = 0
  
  until driver.title.start_with? "Selenium/Test - #{i} at master"
    
    driver.find_element(:xpath, "//*[@title='Test - #{i}']").click
    sleep 0.5
    k= k+1
    
  end
  
  puts "Took needed to try #{k} time(s) to select the file"
  
  #wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  #wait.until {driver.title.start_with? "Selenium/Test - #{i} at master"}
  
  #sleep(5)
  
  puts "Page title is #{driver.title}"
  
  driver.find_element(:xpath, '//*[@id="js-repo-pjax-container"]/div[2]/div[1]/div[3]/div[1]/div[1]/form[2]/button').click
  
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  wait.until { driver.title.downcase.start_with? "deleting" }
  
  #sleep(10)
  
  puts "Page title is #{driver.title}"
  
  l=0
  
  until  driver.title.downcase.start_with? "s-irvine" 
    driver.find_element(:id, "submit-file").click
    sleep 0.5
    l= l+1
    
  end
  
  puts "Took needed to try #{l} time(s) to delete the file"
  
  #wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  #wait.until { driver.title.downcase.start_with? "s-irvine" }

  #sleep(10)
  
  puts "Page title is #{driver.title}"
  
  driver.quit
end

puts "Cleanup has finished"
