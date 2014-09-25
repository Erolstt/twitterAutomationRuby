require_relative '../../src/pageObjects/abstract_page'
require_relative '../../src/pageObjects/home_page'
require 'rspec'

class SearchPage < AbstractPage

  def initialize (driver)
    super(driver)
  end

  def getSearchedUserName
    return @@driver.find_element(:css,'.stream-item-header .username.js-action-profile-name').text
  end

  def followSearchedUser
    @@driver.find_element(:css, 'a[data-nav="users"]').click
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until { @@driver.find_element(:css, '.button-text.follow-text').displayed? }
    @@driver.find_element(:css, '.button-text.follow-text').click
    return SearchPage.new(@@driver)
  end
end