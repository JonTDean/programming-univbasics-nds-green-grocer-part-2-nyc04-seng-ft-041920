require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)

	# Check the entire cart Array for hashes
	cart.each do |cart_hash|
		# Check the entire coupons array for hashes
		coupons.each do |coupon_hash|
			# Compare Values and then shove into cart if the return is true.
			if coupon_hash[:item] == cart_hash[:item]
				# The cart_hash[:count] needs to be reduced to reflect the coupon_hash count
				cart_hash[:count] -= coupon_hash[:num]
				# The discounted price needs to be calculated
				discounted_price = coupon_hash[:cost] / coupon_hash[:num] 
				# The final array is shoveled the following hash values
				cart << {:item => "#{cart_hash[:item]} W/COUPON", :price => discounted_price, :clearance => cart_hash[:clearance], :count => coupon_hash[:num]} #Exp. 1
			end 
		end	
	end
end

def apply_clearance(cart)
	# Check the entire cart Array for hashes
	cart.each do |cart_hash|
		# if cart_hash[:clearance] returns true then apply the percentage reduction
		if cart_hash[:clearance]
			cart_hash[:price] -= (20 * cart_hash[:price]) / 100
		end
	end
end # Exp. 2

def checkout(cart, coupons)
  final_price = 0
  
  consolidate_cart(cart).each do |items|
    if items[:clearance]                                 
      final_price += apply_clearance(cart)[:price].reduce(:+) 
    end
  end
# 	if cart.length < 2
#     consolidate_cart(cart).each do |item|
#       final_price += item[:price]
#     end
#     return final_price
#   elsif coupons.length < 2
#       consolidate_cart(cart).each do |item|
#         final_price += item[:price]
#       end
#     return final_price
#   elsif coupons.length > 1 
#     apply_coupons(consolidate_cart(cart), coupons).each do |item|
#       final_price += item[:price]
#     end
#     return final_price
#   end
end

# pp apply_coupons(consolidate_cart(cart), coupons)
# Run this file with
# ruby lib/grocer_part_2.rb