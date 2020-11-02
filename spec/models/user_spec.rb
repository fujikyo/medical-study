require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザーサインアップ機能' do
    context 'ユーザー情報が保存できる正常系' do
      it '全ての情報が入っていれば保存できる' do
        expect(@user).to be_valid
      end
    end
    context 'ユーザー情報が保存できない異常系' do
      it 'emailが空欄で登録不可' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが重複する場合は登録不可' do
        user1 = FactoryBot.create(:user)
        user2 = FactoryBot.build(:user)
        user2.email = user1.email
        user2.valid?
        expect(user2.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空欄で登録不可' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが５文字以下なら登録不可' do
        @user.password = '000aa'
        @user.password_confirmation = '000aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationが両方存在しないと登録不可' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'nameが空欄で登録不可' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'specializeが空欄で登録不可' do
        @user.specialize = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Specialize can't be blank")
      end
      it 'experienceが空欄で登録不可' do
        @user.experience = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Experience can't be blank")
      end
      it 'wordが空欄で登録不可' do
        @user.word = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Word can't be blank")
      end
      it 'wordが20文字以上で登録不可' do
        @user.word = 'ああああああああああああああああああああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Word is too long (maximum is 20 characters)")
      end
    end
  end
end