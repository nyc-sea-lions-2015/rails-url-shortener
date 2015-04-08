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
end
