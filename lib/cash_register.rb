require 'pry'

class CashRegister
    #attr_accessor :discount

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @all_items = []
        @last_item
    end

    def discount
        @discount
    end

    def all_items
        @all_items
    end

    def last_item
        @last_item
    end

    def total
        @total
    end

    def total=(a)
        @total=a
    end

    def add_item(title, price, quantity=1)
        @last_item = price
        self.total=(@total + (price*quantity))
        self.all_items << (1..quantity).map {title}
        self.all_items.flatten!
        
    end

    def apply_discount()
        if self.discount == 0
            return "There is no discount to apply."
        end
        self.total = self.total * (1- self.discount.to_f/100)
        "After the discount, the total comes to $#{self.total.to_i}."
    end

    def items
        @all_items
    end

    def void_last_transaction
        self.total -= @last_item
        #binding.pry
        if @all_items.count == 0 
            self.total = 0
        end
    end
end
