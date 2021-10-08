class Item < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :itemstatus
  belongs_to :burden
  belongs_to :area_info
  belongs_to :days_to_send

  validates :images, presence: true
  validates :itemname, presence: true
  validates :itemdescription, presence: true
  validates :price, presence: true, numericality: { only_integer: true, :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999 }

  validates :category_id, numericality: { other_than: 1, message: "を入力してください" } 
  validates :itemstatus_id, numericality: { other_than: 1, message: "を入力してください" } 
  validates :burden_id, numericality: { other_than: 1, message: "を入力してください" } 
  validates :area_info_id, numericality: { other_than: 1, message: "を入力してください" } 
  validates :days_to_send_id, numericality: { other_than: 1, message: "を入力してください" } 
end
