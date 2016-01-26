require 'rails_helper'

describe Product do 
	context "when the product has comments" do
		before do
			@product = Product.create!(name: "race bike")
			@user = User.create(email: "test@email.com", password: "12345678")
			@product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
	     end
	 end
	it "returns the average rating of all comments" do
		expect(@product.average_rating).to eq 3.0
	end
	
end