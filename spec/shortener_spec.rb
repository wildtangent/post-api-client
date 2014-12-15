require 'spec_helper'
require 'yaml'
require 'active_support/all'

describe Post::Api::Client::Shortener do

  let :config do
    YAML.load_file("config.yml").symbolize_keys
  end

  let :api_key do
    config[:api_key]
  end

  let :client do
    Post::Api::Client::Shortener.new(api_key)
  end

  it 'should return a shortened URL' do
    response = client.shorten({
      longUrl: "http://bikemagic.com/zfeaturedbox/2014-andalucia-bike-race-the-build-up-part-3.html"
    })

    expect(response["status_txt"]).to eq "OK"
    expect(response['hash']).to eq "MXMRm2"
    expect(response['short_url']).to eq "http://bikemagi.co/MXMRm2"
  end

  it 'should return a customised URL' do
    custom = "testbikemagictenessentials#{Time.now.to_i}"
    response = client.customize({
      longUrl: "http://bikemagic.com/news/ten-essentials-surviving-an-alpine-stage-race.html",
      custom: custom
    })

    expect(response["status_txt"]).to eq "OK"
  end



end
