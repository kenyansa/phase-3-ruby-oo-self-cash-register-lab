class CashRegister
    attr_accessor :discount, :total, :last_transaction, :items

    def initialize (discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end
    #sets an instance variable @total on initialization to zero
    #takes one optional argument, an employee discount, on initialization
    #when called with two arguments: returns an array containing all items that have been added
    #when called with three arguments: returns an array containing all items that have been added, including multiples

    def add_item (title, amount, quantity =1)
        self.last_transaction = amount * quantity
        self.total += self.last_transaction
        quantity.times do 
            self.items << title
        end
    end
    #returns the current total 
    #accepts a title and a price and increases the total
    #also accepts an optional quantity 
    #doesn't forget about the previous total

    def apply_discount
        if self.discount != 0
            percentage_discount = (100.0 - self.discount.to_f) / 100
            self.total = (self.total * percentage_discount).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end
    #applies the discount to the total price.
    #returns success message with updated total
    #reduces the total

    def void_last_transaction
        self.total -= self.last_transaction
    end
    #subtracts the last item from the total
    #returns the total to 0.0 if all items have been removed 
end
