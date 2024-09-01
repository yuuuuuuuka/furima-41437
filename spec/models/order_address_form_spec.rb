require 'rails_helper'

RSpec.describe OrderAddressForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    # @order_address_form = FactoryBot.build(:order_address_form)
    @order_address_form = FactoryBot.build(:order_address_form, user_id: user.id, item_id: item.id)
    # order_params[:token] ×
    #  card:×
  end
  context '内容に問題ない場合' do
    it 'priceとtokenがあれば保存ができること' do
      expect(@order_address_form).to be_valid
    end
  end

  describe '住所登録' do
    context '住所登録ができる時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address_form).to be_valid
      end
      it 'buildは空でも保存ができること' do
        @order_address_form.building = ''
        expect(@order_address_form).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeの入力が空だと保存ができない' do
        @order_address_form.postal_code = ''
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include("Postal code can't be blank",
                                                                    'Postal code must be in the format 123-4567')
      end
      it 'postal_codeの入力が全角数字だと保存ができない' do
        @order_address_form.postal_code = '１２３-４５６７'
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include('Postal code must be in the format 123-4567')
      end

      it 'city入力が空だと保存ができない' do
        @order_address_form.city = ''
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include("City can't be blank")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_address_form.prefecture_id = '1'
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include("Prefecture Prefecture can't be blank")
      end
      it 'addressが空だと保存ができない' do
        @order_address_form.address = ''
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存ができない' do
        @order_address_form.phone_number = ''
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include('Phone number must be 10 or 11 digits')
      end
      it 'phone_numberが全角数字では保存ができない' do
        @order_address_form.phone_number = '１２３４'
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include('Phone number must be 10 or 11 digits')
      end
      it 'phone_numberにハイフンが含まれていると保存できない' do
        @order_address_form.phone_number = '-'
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include('Phone number must be 10 or 11 digits')
      end
      it '電話番号が12桁以上では購入できない' do
        @order_address_form.phone_number = '090123456789'
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include('Phone number must be 10 or 11 digits')
      end

      it 'tokenが空では登録できないこと' do
        @order_address_form.token = nil
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include("Token can't be blank")
      end
      # it 'priceが空では保存ができないこと' do
      # @order_address_form.price = nil
      # @order_address_form.valid?
      # expect(@order_address_form.errors.full_messages).to include("Price can't be blank")カリキュラムに書いてあるけど必要ないのでは？なぜなら、購入フォーマットに金額の記載がないから
      # end
    end
  end
end
