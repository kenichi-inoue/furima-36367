require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}" 不要のため削除

  before do
    @user = FactoryBot.build(:user)
  end

  # describe 'ユーザー新規登録' do
  #   context '新規登録できる場合' do
  #     it "nameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
  #     end
  #   end

  #   context '新規登録できない場合' do
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

  it 'passwordが半角英数字混合でなければ登録できない(英字のみ)' do
    @user.password = 'asdzxcd'
    @user.password_confirmation = 'asdzxcd'
    # binding.pry
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is invalid')
  end

  it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
    @user.password = '123456'
    @user.password_confirmation = '1234567'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
end

# ニックネームが必須であること。
# メールアドレスが必須であること。
# メールアドレスが一意性であること。
# メールアドレスは、@を含む必要があること。
# パスワードが必須であること。
# パスワードは、6文字以上での入力が必須であること
# パスワードは、半角英数字混合での入力が必須であること
# パスワードとパスワード（確認）は、値の一致が必須であること。

# it 'パスワードは、半角英数字混合での入力が必須であること' do
#   @user.password ='/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i'
#   @user.password_confirmation ='/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i'
#   expect(@user).to be_valid
# end
