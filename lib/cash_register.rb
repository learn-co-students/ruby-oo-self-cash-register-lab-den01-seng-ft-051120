require 'pry'
class CashRegister
    attr_accessor :total, :discount
    attr_reader :items

    def initialize discount = 0, total = 0
        @total = total
        @discount = discount
        @items = []
    end

    def add_item item, price, quantity = 1
        @quantity = quantity
        @total += price * quantity
        quantity.times do
            @items << item
        end
        @last_transaction_price = price
        @last_transaction_items = item
    end

    def apply_discount
        if @discount > 0
            @discount = @discount / 100.to_f
            @total = @total - (@total * discount)
            return "After the discount, the total comes to $#{total.round}."
        end

        if @discount <= 0
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        @quantity.times do
            @items.pop
        end
        if items.first == nil
            @total = 0.0
        end 
        if @items.first != nil
            @total -= @last_transaction_price
        end
    end

end