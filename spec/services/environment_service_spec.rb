require 'spec_helper'

describe EnvironmentService do
  describe "twitter credentials" do
    it "should return twitter credentials set in env" do
      expect(EnvironmentService.twitter_bearer_credentials).to eq(ENV["TWITTER_BEARER_CREDENTIALS"])
    end
    it "should return nil if twitter credentials are not set in env" do
      default_cred = ENV["TWITTER_BEARER_CREDENTIALS"]
      ENV["TWITTER_BEARER_CREDENTIALS"] = ""
      expect(EnvironmentService.twitter_bearer_credentials).to be_nil
      ENV["TWITTER_BEARER_CREDENTIALS"] = default_cred
    end
  end
  describe "instagram credentials" do
    it "should return twitter credentials set in env" do
      expect(EnvironmentService.instagram_client_id).to eq(ENV["INSTAGRAM_CLIENT_ID"])
    end
    it "should return nil if twitter credentials are not set in env" do
      default_cred = ENV["INSTAGRAM_CLIENT_ID"]
      ENV["INSTAGRAM_CLIENT_ID"] = ""
      expect(EnvironmentService.instagram_client_id).to be_nil
      ENV["INSTAGRAM_CLIENT_ID"] = default_cred
    end
  end

  describe "disable retweets" do
    it "should return what is set in env" do 
      test_env = ENV["DISABLE_RETWEETS"]
      ENV["DISABLE_RETWEETS"] = "false"
      expect(EnvironmentService.disable_retweets).to be_false
      ENV["DISABLE_RETWEETS"] = test_env 
    end

    it "should return true by default" do
      test_env = ENV["DISABLE_RETWEETS"]
      ENV["DISABLE_RETWEETS"] = ""
      expect(EnvironmentService.disable_retweets).to be_true
      ENV["DISABLE_RETWEETS"] = test_env      
    end
  end
end
