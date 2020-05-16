class CashRegister


    attr_accessor :total, :item_list
    attr_reader :discount 


    def initialize discount = 0, total = 0, item_list = []
        @discount = discount
        @total = total 
        @item_list = item_list 
    end 

    def add_item name, price, quantity = 1
        quantity.times do 
            self.item_list << [name, price]
        end 
        collect
    end 

    def collect 
        self.total = self.item_list.reduce(0){|sum, item| sum+item[1]}
    end 

    def items
        self.item_list.map(& :first)
    end 

    def apply_discount
        if self.discount == 0
            p "There is no discount to apply."
        else 
            self.total = (self.total - (self.total * self.discount / 100))
            p "After the discount, the total comes to $#{self.total.to_i}."
        end 
    end 

    def void_last_transaction
        last = self.item_list.pop 
        while last == self.item_list.last
            self.item_list.pop 
        end
        collect 
    end 
end 
