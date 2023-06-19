require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'password_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが6文字未満では登録できない' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'passwordとpassword_confirmationが一致しないと登録できない' do
      @user.password_confirmation = 'password'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'お名前(全角)の名字が必須であること' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it 'お名前(全角)の名前が必須であること' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'お名前(全角)は全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.family_name = 'Smith'
      @user.first_name = 'John'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid", "First name is invalid")
    end

    it 'お名前カナ(全角)の名字が必須であること' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end

    it 'お名前カナ(全角)の名前が必須であること' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'お名前カナ(全角)は全角（カタカナ）での入力が必須であること' do
      @user.family_name_kana = '山田'
      @user.first_name_kana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid", "First name kana is invalid")
    end
    
    it '生年月日が必須であること' do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end