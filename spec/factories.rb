FactoryGirl.define do 
	
	factory :user do
		email "test@example.com"
		password "12345678"
		admin false
	end

	factory :product do
		name "test product"
		description "this is a test"
		price 10
	end

	factory :comment do 
		body "good product"
		rating 5
	end

	factory :order do 
	end 

end