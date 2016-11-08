#require 'selenium-webdriver'
#require 'rspec/expectations'
#include RSpec::Matchers
##require 'net/http' 

##http = Net::HTTP.new(@host, @port)
##http.read_timeout = 500

#def setup
#  @driver = Selenium::WebDriver.for(
#    :remote,
#    url: 'http://172.19.0.3:5555/wd/hub',
#    #url: any,
#    desired_capabilities: :firefox) # you can also use :chrome, :safari, etc.
#end

#def teardown
#  @driver.quit
#end

#def run
#  setup
#  yield
#  teardown
#end

#run do
#  #@driver.manage.timeouts.page_load = 300
#  @driver.get 'http://the-internet.herokuapp.com'
#  expect(@driver.title).to eq('The Internet')
#end

require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox
driver.get "http://google.com"

element = driver.find_element :name => "q"
element.send_keys "Cheese!"
element.submit

puts "Page title is #{driver.title}"

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
wait.until { driver.title.downcase.start_with? "cheese!" }

puts "Page title is #{driver.title}"
driver.quit
