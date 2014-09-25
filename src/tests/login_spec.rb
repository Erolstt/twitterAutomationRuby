require 'rspec'
require 'selenium-webdriver'
require_relative '../../src/pageObjects/login_page'

describe 'Testing twitter login' do

  app = nil

  before(:all) do
    @userName = 'automateduserme'
    @password = '123456test'
    @searchedUserName = 'pekermert'
  end

  before(:each) do
    app = AbstractPage.new(Selenium::WebDriver.for(:firefox))
  end

  after(:each) do
    app.quit
  end

  it 'should login with valid credentials' do

    loginTwitter = app
      .goToTwitter
      .login(@userName,@password)

    expect(loginTwitter.getUserName).to be == @userName

  end

  it "should be able to search user" do

    loginTwitter = app
      .goToTwitter
      .login(@userName, @password)
      .searchUser(@searchedUserName)

  end

  it "should be able to send tweet" do

    sendTweet = app
      .goToTwitter
      .login(@userName,@password)
      .sendTweet('Hello Twitter! Rspec')

  end
end