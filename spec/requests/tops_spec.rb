require 'rails_helper'

RSpec.describe "Tops", type: :request do
  describe "トップページ" do
    it "正常なレスポンスを返すこと" do
      get root_path
      expect(response.status).to eq 200
    end
  end

  describe "利用規約ページ" do
    it "正常なレスポンスを返すこと" do
      get terms_of_service_path
      expect(response.status).to eq 200
    end
  end
end
