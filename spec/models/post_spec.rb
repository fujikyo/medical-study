require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '記事投稿機能' do
    context '商品情報が保存できる正常系' do
      it '全ての情報が入っていれば保存できる' do
        expect(@post).to be_valid
      end
    end
    context '商品情報が保存できない異常系' do
      it 'titleが空欄で登録不可' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end
      it 'detailが空欄で登録不可' do
        @post.detail = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Detail can't be blank")
      end
    end
  end
end