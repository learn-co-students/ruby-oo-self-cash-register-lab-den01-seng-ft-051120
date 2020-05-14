
class CashRegister
    attr_accessor :total, :discount, :items, :last_item
    def initialize discount = 0
        @total = 0
        @discount = discount
        @items = []
        @last_item = {}
    end

    def add_item item, price, quantity = 1
        @last_item[:quantity] = quantity
        @last_item[:price] = price
        @last_item[:item] = item
        quantity.times { self.items << item }
        self.total += price * quantity
    end

    def apply_discount
        if @discount > 0
            self.total = self.total - self.total * self.discount / 100
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= @last_item[:quantity] * @last_item[:price]
        @last_item[:quantity].times { items.pop }
    end
end