require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it '全ての項目が入力されていれば登録できる' do
      expect(@user).to be_valid
    end

    it '重複したメールアドレスは登録できない' do
      FactoryBot.create(:user, email: 'test@example.com')
      @user.email = 'test@example.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email has already been taken')
    end

    it 'メールアドレスに@を含まない場合は登録できない' do
      @user.email = 'testexample.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it '英字のみのパスワードでは登録できない' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password must contain at least one letter and one digit')
    end

    it '数字のみのパスワードでは登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password must contain at least one letter and one digit')
    end

    it '全角文字を含むパスワードでは登録できない' do
      @user.password = 'パスワード123'
      @user.password_confirmation = 'パスワード123'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password must contain at least one letter and one digit')
    end

    context 'お名前(全角)の名字' do
      it '必須であること' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it '全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.family_name = 'Smith'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
    end

    context 'お名前(全角)の名前' do
      it '必須であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it '全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.first_name = 'John'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
    end

    context 'お名前カナ(全角)の名字' do
      it '必須であること' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it '全角（カタカナ）での入力が必須であること' do
        @user.family_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end
    end

    context 'お名前カナ(全角)の名前' do
      it '必須であること' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it '全角（カタカナ）での入力が必須であること' do
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
    end

    it '生年月日が必須であること' do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
