require 'spec_helper'

describe CustomUrlHelper do
  include_context 'env stashing'

  shared_examples 'a url with extra pieces' do
    it 'should allow extra pieces to be passed to the url' do
      expect(helper.send(meth, 'something')).to eql("#{url}/something")
    end
  end

  it 'should have a default domain' do
    expect(ENV['CHEF_DOMAIN']).to be_nil
    expect(helper.chef_domain).to eql('getchef.com')
  end

  it 'should have a server url' do
    expect(ENV['CHEF_SERVER_URL']).to be_nil
    expect(helper.chef_server_url).to eql('https://api.opscode.com')
  end

  describe 'www url' do
    let(:meth) { :chef_www_url }
    let(:url) { 'https://www.getchef.com' }

    it 'should have a www url that uses the default domain' do
      expect(ENV['CHEF_WWW_URL']).to be_nil
      expect(helper.send(meth)).to eql(url)
    end

    it_should_behave_like 'a url with extra pieces'
  end

  describe 'blog url' do
    let(:meth) { :chef_blog_url }
    let(:url) { 'https://www.getchef.com/blog' }

    it 'should have a blog url that uses the www url' do
      expect(ENV['CHEF_BLOG_URL']).to be_nil
      expect(helper.send(meth)).to eql(url)
    end

    it_should_behave_like 'a url with extra pieces'
  end

  describe 'docs url' do
    let(:meth) { :chef_docs_url }
    let(:url) { 'https://docs.getchef.com' }

    it 'should have a docs url that uses the default domain' do
      expect(ENV['CHEF_DOCS_URL']).to be_nil
      expect(helper.send(meth)).to eql(url)
    end

    it_should_behave_like 'a url with extra pieces'
  end

  describe 'downloads url' do
    let(:meth) { :chef_downloads_url }
    let(:url) { 'https://downloads.getchef.com' }

    it 'should have a downloads url that uses the default domain' do
      expect(ENV['CHEF_DOWNLOADS_URL']).to be_nil
      expect(helper.send(meth)).to eql(url)
    end

    it_should_behave_like 'a url with extra pieces'
  end

  it 'should have an identity url that uses the server url' do
    expect(ENV['CHEF_IDENTITY_URL']).to be_nil
    expect(helper.chef_identity_url).to eql('https://api.opscode.com/id')
  end

  it 'should have a manage url that matches the server url' do
    expect(ENV['CHEF_MANAGE_URL']).to be_nil
    expect(helper.chef_manage_url).to eql('https://api.opscode.com')
  end

  it 'should have an oauth2 url that matches the server url' do
    expect(ENV['CHEF_OAUTH2_URL']).to be_nil
    expect(helper.chef_oauth2_url).to eql('https://api.opscode.com')
  end

  it 'should have a profile url that matches the manage url' do
    expect(ENV['CHEF_PROFILE_URL']).to be_nil
    expect(helper.chef_profile_url).to eql('https://api.opscode.com')
  end

  it 'should have a sign up url that uses the manage url' do
    expect(ENV['CHEF_SIGN_UP_URL']).to be_nil
    expect(helper.chef_sign_up_url).to eql('https://api.opscode.com/signup?ref=community')
  end

  it 'should have a learn chef url that uses the default domain' do
    expect(ENV['LEARN_CHEF_URL']).to be_nil
    expect(helper.learn_chef_url).to eql('https://learn.getchef.com')
  end
end
