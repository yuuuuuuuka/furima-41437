class OrderAddressForm
  include ActiveModel::Model
  attr_accessor :postal_code, :city, :address, :building, :phone_number, :prefecture_id, :order_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :user_id
    validates :item_id
    validates :token
    validates :city
    validates :address
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'must be in the format 123-4567' }

    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'must be 10 or 11 digits' }
  end

  def save
    return false unless valid?

    @order = Order.create(user_id:, item_id:)
    Address.create(
      postal_code:,
      city:,
      address:,
      building:,
      phone_number:,
      order_id: @order.id,
      prefecture_id:
    )
  end
end
