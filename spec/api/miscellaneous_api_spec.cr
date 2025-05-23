# #Clerk Backend API
#
##The Clerk REST Backend API, meant to be accessed by backend servers.  ### Versions  When the API changes in a way that isn't compatible with older versions, a new version is released. Each version is identified by its release date, e.g. `2025-03-12`. For more information, please see [Clerk API Versions](https://clerk.com/docs/versioning/available-versions).  Please see https://clerk.com/docs for more information.
#
#The version of the OpenAPI document: 2025-03-12
#Contact: support@clerk.com
#Generated by: https://openapi-generator.tech
#Generator version: 7.12.0
#

require "../spec_helper"
require "json"
require "time"

# Unit tests for Clerk::MiscellaneousApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe "MiscellaneousApi" do
  describe "test an instance of MiscellaneousApi" do
    it "should create an instance of MiscellaneousApi" do
      api_instance = Clerk::MiscellaneousApi.new
      # TODO expect(api_instance).to be_instance_of(Clerk::MiscellaneousApi)
    end
  end

  # unit tests for get_public_interstitial
  # Returns the markup for the interstitial page
  # The Clerk interstitial endpoint serves an html page that loads clerk.js in order to check the user&#39;s authentication state. It is used by Clerk SDKs when the user&#39;s authentication state cannot be immediately determined.
  # @param [Hash] opts the optional parameters
  # @option opts [String] :frontend_api Please use &#x60;frontend_api&#x60; instead
  # @option opts [String] :frontend_api2 The Frontend API key of your instance
  # @option opts [String] :publishable_key The publishable key of your instance
  # @option opts [String] :proxy_url The proxy URL of your instance
  # @option opts [String] :domain The domain of your instance
  # @option opts [String] :sign_in_url The sign in URL of your instance
  # @option opts [Bool] :use_domain_for_script Whether to use the domain for the script URL
  # @return [nil]
  describe "get_public_interstitial test" do
    it "should work" do
      # assertion here. ref: https://crystal-lang.org/reference/guides/testing.html
    end
  end

end
