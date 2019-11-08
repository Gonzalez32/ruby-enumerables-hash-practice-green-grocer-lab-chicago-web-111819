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
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
