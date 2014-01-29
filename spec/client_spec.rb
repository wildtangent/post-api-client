require 'spec_helper'
require 'yaml'
require 'active_support/all'

describe Post::Api::Client::Client do
  
  let :config do
    YAML.load_file("config.yml").symbolize_keys
  end
  
  let :api_key do 
    config[:api_key]
  end

  let :client do
    Post::Api::Client::Client.new(api_key)
  end
  
  it 'should return a shortened URL' do
    response = client.shorten({
      longUrl: "http://bikemagic.com/zfeaturedbox/2014-andalucia-bike-race-the-build-up-part-3.html"
    })
    
    response["status_txt"].should == "OK"
    response['hash'].should == "MXMRm2"
    response['short_url'].should == "http://bikemagi.co/MXMRm2"
  end
  
  it 'should return a customised URL' do
    custom = "testbikemagictenessentials#{Time.now.to_i}"
    response = client.customize({
      longUrl: "http://bikemagic.com/news/ten-essentials-surviving-an-alpine-stage-race.html",
      custom: custom
    })
    
    response["status_txt"].should == "OK"
  end
  


end