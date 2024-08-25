require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '出品が成功する場合' do
      it 'すべての必須項目が正しく入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '出品が失敗する場合' do
      it '画像が添付されていないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'カテゴリーが未選択では出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が未選択では出品できない' do
        @item.item_situation_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item situation can't be blank")
      end
      it '配送料の負担が未選択では出品できない' do
        @item.load_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Load can't be blank")
      end

      it '発送元の地域が未選択では出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数が未選択では出品できない' do
        @item.shipping_location_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping location can't be blank")
      end
      it '価格が空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が300円未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be between ¥300 and ¥9,999,999')
      end

      it '価格が10,000,000円以上では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be between ¥300 and ¥9,999,999')
      end

      it '価格が全角数字では出品できない' do
        @item.price = '３０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be between ¥300 and ¥9,999,999')
      end

      it '価格が半角英字では出品できない' do
        @item.price = 'three thousand'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be between ¥300 and ¥9,999,999')
      end

      it '価格が半角英数字混合では出品できない' do
        @item.price = '3000yen'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be between ¥300 and ¥9,999,999')
      end
      it 'ユーザーが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
