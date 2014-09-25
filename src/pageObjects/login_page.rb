require_relative '../../src/pageObjects/abstract_page'
require_relative '../../src/pageObjects/home_page'
require_relative '../../src/pageObjects/search_page'
require 'rspec'

class LoginPage < AbstractPage

  def initialize (driver)
    super(driver)
  end

  def login (userName, password)
    @@driver.find_element(:id, 'signin-email').send_keys userName
    @@driver.find_element(:id, 'signin-password').send_keys password
    @@driver.find_element(:css,'.submit.btn.primary-btn.flex-table-btn.js-submit' ).click

    return HomePage.new(@@driver)
  end

  def typeUserName(userName)
    @@driver.find_element(:id, 'signin-email').send_keys userName
    return LoginPage.new(@@driver)
  end

  def typePassword(password)
    @@driver.find_element(:id, 'signin-password').send_keys password
    return LoginPage.new(@@driver)
  end

  def clickLoginButton
    @@driver.find_element(:css,'.submit.btn.primary-btn.flex-table-btn.js-submit' ).click
    return HomePage.new(@@driver)
  end
end