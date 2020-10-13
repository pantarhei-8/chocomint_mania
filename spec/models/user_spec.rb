require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end

    describe "ユーザー新規登録" do
      context "新規登録がうまくいく場合" do
        it "name、email、password、password_confirmationがあれば登録されること" do
          expect(@user).to be_valid
        end
      end

      context "新規登録がうまくいかない場合" do
        it "nameが空では登録できないこと" do
          @user.name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("ユーザー名を入力してください")
        end

        it "emailが空では登録できないこと" do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Eメールを入力してください")
        end

        it "emailが@がなければ登録できないこと" do
          @user.email = "sample.com"
          @user.valid?
          expect(@user.errors.full_messages).to include("Eメールは不正な値です")
        end

        it "重複したemailが存在する場合は登録できないこと" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
        end

        it "passwordが空では登録できないこと" do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードを入力してください")
        end

        it "passwordが5文字以下では登録できないこと" do
          @user.password = "aa345"
          @user.password_confirmation = "aa345"
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
        end

        it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
          @user.password = "abc123"
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
        end
      end
    end
  end
end
