class OrderAddressForm
  include ActiveModel::Model
  attr_accessor :postal_code, :city, :address, :building, :phone_number, :prefecture_id, :order_id, :user_id, :item_id, :token

  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: 'must be in the format 123-4567' }
  validates :city, presence: true
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "Prefecture can't be blank" }
  validates :address, presence: true
  # validates :building
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: 'must be 10 or 11 digits' }

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :token, presence: true

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
