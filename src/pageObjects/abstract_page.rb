require 'rspec'
require 'selenium-webdriver'
require_relative '../../src/pageObjects/login_page'

class AbstractPage

  @@driver = nil

  def initialize (driver)
    @@driver = driver
  end

  def goToTwitter
    @@driver.navigate.to('https://twitter.com/')
    return LoginPage.new(@@driver)
  end

  def quit
    @@driver.quit
  end

  def getPageTitle
    return @@driver.title
  end

end