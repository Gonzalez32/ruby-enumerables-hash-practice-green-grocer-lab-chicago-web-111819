def consolidate_cart(cart)
  consolidate_cart = {}
  cart.each do | item_data |
    item_data.each do | item, stuff |
      if consolidate_cart.keys.include?(item)
        consolidate_cart[item][:count] += 1
      else
        consolidate_cart[item] = stuff
        consolidate_cart[item][:count] = 1
end
end
end
consolidate_cart
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
  if cart.keys.include?(coupon[:item])
    if cart[coupon[:item]][:count] >= coupon[:num]
        cart[coupon[:item]][:count] -= coupon[:num]
        new_item = "#{coupon[:item]} W/COUPON"
        if cart.keys.include?(new_item)
          cart[new_item][:count] += 1
        else
          cart[new_item] = {:price => coupon[:cost], 
          :count => 1, :clearance =>  cart[coupon[:item]][:clearance]}
        end
      end
    end
  end
  cart
end	
  

def apply_clearance(cart)
  cart.each do |item, details|
    if details[:clearance] == true
      details[:price] = (details[:price] * 0.8).round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  cart = consolidate_cart(cart: cart)
end 	  cart = apply_coupons(cart: cart, coupons: coupons)
  cart = apply_clearance(cart: cart)
  result = 0
  cart.each do |food, info|
    result += (info[:price] * info[:count]).to_f
  end
  result > 100 ? result * 0.9 : result
end
