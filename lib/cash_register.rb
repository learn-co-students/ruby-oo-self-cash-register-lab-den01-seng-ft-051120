
require 'pry'

class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end


    def add_item(item, price, quantity = 1)
        @price = price
        @last_item = 0
        @total += price * quantity
        if quantity > 1
            i = 0
            while i < quantity
                @last_item = @price
                @items << item
                i += 1
            end
        else
            @last_item = @price
            @items << item
        end
        @last_transaction = price * quantity
    end


    def items
        @items
    end
  

    def apply_discount
        if @discount > 0
        price_reduce = ((@total * (1-(@discount.to_f/100))).to_i)
        @total = price_reduce
        p "After the discount, the total comes to $#{@total}."
        else
        p "There is no discount to apply."
        end
    end  



#     def void_last_transaction
#         #binding.pry
#        if @items.length >= 2
#             @total -= @last_item
#             binding.pry
#        else
# #           return @total = "thx1138".to_f
#            binding.pry
#        end


    def void_last_transaction
        @total -= @last_transaction
    end 





end


