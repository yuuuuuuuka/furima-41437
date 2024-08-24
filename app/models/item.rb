class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :name, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }

  belongs_to :item_situation
  validates :name, presence: true
  validates :item_situation_id, numericality: { other_than: 1, message: "can't be blank" }

  belongs_to :load
  validates :name, presence: true
  validates :load_id, numericality: { other_than: 1, message: "can't be blank" }

  belongs_to :prefecture
  validates :name, presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  belongs_to :shipping_location
  validates :name, presence: true
  validates :shipping_location_id, numericality: { other_than: 1, message: "can't be blank" }

  validates :name, presence: true
  validates :price, numericality: {
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999,
    message: 'must be between ¥300 and ¥9,999,999'
  }, presence: true

  validates :name, presence: true
  validates :image, presence: true
  validates :explanation, presence: true
end
