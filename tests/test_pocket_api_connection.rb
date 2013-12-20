lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'minitest/spec'
require 'minitest/autorun'
require 'pocket_api'

describe PocketApi::Connection do

  attr_reader :connection

  def setup
    @connection = PocketApi::Connection
    @connection.client_key = "4"
  end

  it "sets default base_uri to https://getpocket.com" do
    PocketApi::Connection.base_uri.must_equal "https://getpocket.com"
  end
  
  it "sets default Content-Type and X-Accept headers for application/json" do
    default_headers = PocketApi::Connection.default_options[:headers]
    default_headers["Content-Type"].wont_be_nil
    default_headers["Content-Type"].must_match /^application\/json/
    default_headers["X-Accept"].wont_be_nil
    default_headers["X-Accept"].must_match /^application\/json/
  end

  describe "generate_request_token" do
    it "returns params :code if response success" do
      request_token = connection.generate_request_token
      assert_equal "?", request_token
    end
    it "raises error if response not success or params :code is missing"
  end

  describe "generate_access_token" do
    it "returns params :code if response success"
    it "raises error if response not success or params :code is missing"
  end
  
  describe "generate_authorize_url" do
    it "return https://getpocket.com/v3/oauth/request with params request token and redirect_uri"
    it "return https://getpocket.com/v3/oauth/request with params request token, redirect_uri, and state"
  end
end
