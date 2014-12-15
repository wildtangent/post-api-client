require 'spec_helper'
require 'yaml'
require 'active_support/all'

describe Post::Api::Client::Analytics do

  let :config do
    YAML.load_file("config.yml").symbolize_keys
  end

  let :access_token do
    config[:access_token]
  end

  let :publisher_key do
    config[:publisher_key]
  end

  let :analytics do
    Post::Api::Client::Analytics.new(publisher_key, access_token)
  end

  let :params do
    {
      "period-from" => "2014-12-10",
      "period-to" => "2014-12-10"
    }
  end


  it 'should get daily analytics' do
    result = analytics.daily(params)
    expect(result.first).to eq(
      "date" => "2014-12-10",
      "clicks" => 622,
      "shares" => 23
    )
  end

  it 'should get content analytics' do
    result = analytics.content(params)
    expect(result.first).to eq(
      "url" => "http://bikemagic.com/how-to/mountain-bike-maintenance/replace-your-bottom-bracket.html",
      "clicks" => 0,
      "shares" => 11
    )
  end

  it 'should get services analytics' do
    result = analytics.services(params)
    expect(result.first).to eq(
      "service" => "Copy text",
      "serviceCode" => "clipboard",
      "shares" => 22,
      "clicks" => 0
    )
  end

  it 'should get country analytics' do
    result = analytics.country(params)
    expect(result.first).to eq(
      "clicks" => 314,
      "country" => "United Kingdom",
      "countryCode" => "GB",
      "shares" => 15,
    )
  end


end
