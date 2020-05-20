require "pry"
class CashRegister

    attr_accessor :total, :discount, :all_items, :last_item

    def initialize (discount = 0)
        @total = 0
        @discount = discount
        @all_items = []
        @last_item
    end

    def add_item (title, price, quantity = 1)
        @total += price * quantity 
        quantity.times do   
          @all_items << title
        end
        @last_item = price * quantity
        
    end

    def apply_discount 
        @total -= @total * discount / 100 
        if @discount == 0
            p "There is no discount to apply."
        else
            p "After the discount, the total comes to $#{@total}."
        end
    end

    def items
        @all_items
    end

    def void_last_transaction
        @all_items.pop()
        @total -= @last_item

    end
end

#binding.pry