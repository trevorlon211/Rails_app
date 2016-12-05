class Product < ActiveRecord::Base
  has_many :orders
  has_many :comments
  belongs_to :users
  belongs_to :category, required: false


  validates :name, presence: true
  validates :description, presence: true
  

  def average_rating
    comments.average(:rating).to_f
  end

  def price_in_cents
    (price * 100).to_i
  end


end
 
 