require 'rails_helper'

describe ProductsController, type: :controller do
  let(:image) {attributes_for(:image)}
  before do
    @user = create(:user)
    sign_in @user
  end
  describe 'GET #new' do
    it "new.html.hamlに遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end
  describe 'GET #index' do
    it "index.html.hamlに遷移すること" do
      get :index
      expect(response).to render_template :index
    end
  end
end