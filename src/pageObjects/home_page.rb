require 'rspec'
require_relative '../../src/pageObjects/abstract_page'
require_relative '../../src/pageObjects/search_page'

class HomePage < AbstractPage

  def initialize (driver)
    super(driver)
  end

  def getUserName
    return @@driver.find_element(:css, '.u-linkComplex-target').text
  end

  def searchUser(userName)
    @@driver.find_element(:id, 'search-query').send_keys(userName)
    @@driver.find_element(:css, 'button[type=submit].nav-search').click
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until { @@driver.find_element(:css, 'a[data-nav="users"]').displayed? }
    @@driver.find_element(:css, 'a[data-nav="users"]').click
    return SearchPage.new(@@driver)
  end

  def sendTweet(coolWords)

    @@driver.find_element(:id, 'tweet-box-mini-home-profile').click
    @@driver.find_element(:id, 'tweet-box-mini-home-profile').send_keys(coolWords)
    @@driver.find_element(:css, '.btn.primary-btn.tweet-action.tweet-btn.js-tweet-btn').click
    return HomePage.new(@@driver)

  end

end