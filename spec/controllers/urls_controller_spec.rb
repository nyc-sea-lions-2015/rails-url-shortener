require "rails_helper"

describe UrlsController  do
  context "#index" do
    it "assigns new Url object to instance variable" do
      get :index
      expect(assigns(:url)).to be_a_new(Url)
    end
    it "assigns array of all existing Urls to instance variable" do
      get :index
      expect(assigns(:urls)).to eq Url.all.order(:created_at)
    end
  end


  context "#create" do
    it "creates new url object " do
      params = {url: {long: "http://google.com"}}
      expect{post :create, params}.to change{Url.count}.by(1)
    end
    it "create new url that should be listed on index" do
      params = { url: {long: "http://google.com"}}
      post :create, params
      url = Url.last
      expect(response).to be_redirect
      response.should redirect_to(root_path)
      # get :index
      # response.body.should have_content(url.short)
    end
  end

  context "#find_long" do
    # let(:test_url) {Url.create(long: "http://google.com")}
    it "finds url object by short attribute" do

      get :find_long, params
      expect(assigns(:url)).to eq Url.find_by(short: params[:short_url])
    end

    # it "increases click_count for Url object" do
    # end

    # it "redirects to long url" do
    # end

  end



end
