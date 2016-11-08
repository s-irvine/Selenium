require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers
#require 'net/http' 

#http = Net::HTTP.new(@host, @port)
#http.read_timeout = 500

def setup
  @driver = Selenium::WebDriver.for(
    :remote,
    #url: 'http://172.19.0.3:5555',
    url: any,
    desired_capabilities: :firefox) # you can also use :chrome, :safari, etc.
end

def teardown
  @driver.quit
end

def run
  setup
  yield
  teardown
end

run do
  #@driver.manage.timeouts.page_load = 300
  @driver.get 'http://the-internet.herokuapp.com'
  expect(@driver.title).to eq('The Internet')
end
