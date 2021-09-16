class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :itemstatus
  belongs_to :burden
  belongs_to :area_info
  belongs_to :days_to_send

  validates :itemname, presence: true
  validates :itemdescription, presence: true
  validates :price, presence: true

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :itemstatus_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :burden_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :area_info_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :days_to_send_id, numericality: { other_than: 1, message: "can't be blank" } 
end
