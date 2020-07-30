require 'rails_helper'

describe ProductsController, type: :controller do
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
end