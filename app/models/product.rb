class Product < ActiveRecord::Base
  has_many :orders
  has_many :comments
  belongs_to :users


  validates :name, presence: true
  validates :description, presence: true
  validate :picture_size

  def average_rating
    comments.average(:rating).to_f
  end

  def price_in_cents
    (price * 100).to_i
  end


end
 
 