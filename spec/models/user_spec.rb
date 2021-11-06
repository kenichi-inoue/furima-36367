require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'すべての項目が入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'ニックネームが必須であること' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'inoken.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードに全角が含まれている場合登録できない' do
        @user.password = '1234５'
        @user.password_confirmation = '1234５'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角英数字混合でなければ登録できない(英字のみ)' do
        @user.password = 'asdzxcd'
        @user.password_confirmation = 'asdzxcd'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '姓（全角）が空だと登録できない' do
        @user.user_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User family name can't be blank")
      end

      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.user_family_name = 'いnうえ'
        @user.valid?
        expect(@user.errors.full_messages).to include('User family name is invalid')
      end

      it '名（全角）が空だと登録できない' do
        @user.user_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User first name can't be blank")
      end

      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.user_first_name = 'いnうえ'
        @user.valid?
        expect(@user.errors.full_messages).to include('User first name is invalid')
      end

      it '姓（カナ）が空だと登録できない' do
        @user.katakana_user_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana user family name can't be blank")
      end

      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.katakana_user_family_name = '#上keん1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Katakana user family name is invalid')
      end

      it '名（カナ）が空だと登録できない' do
        @user.katakana_user_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana user first name can't be blank")
      end

      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.katakana_user_first_name = '#上keん1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Katakana user first name is invalid')
      end

      it '生年月日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
