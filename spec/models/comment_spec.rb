require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿機能' do
    context 'コメントが保存できる正常系' do
      it '全ての情報が入っていれば保存できる' do
        expect(@comment).to be_valid
      end
    end
    context 'コメントが保存できない異常系' do
      it 'contentが空欄で登録不可' do
        @comment.content = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Content can't be blank")
      end
    end
    context 'コメントが保存できない異常系' do
      it 'contentは50文字以内でないと登録不可' do
        @comment.content = 'あああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ'
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Content is too long (maximum is 50 characters)")
      end
    end
  end
end