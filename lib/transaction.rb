class Transaction
  attr_reader :id, :product, :customer, :purchased

  @@transactions = []
  @@id = 1

  def initialize(customer, product, purchased=true)
    @id = @@id
    @customer = customer
    @product = product
    @purchased = purchased
    @@transactions << self
    @@id += 1
    purchased ? product.purchased : product.returned
  end

  def self.all
    @@transactions
  end
  
  def self.find(id)
    @@transactions.find { |transaction| transaction.id == id }
  end

  def self.find_by_customer(customer)
    @@transactions.find_all { |transaction| transaction.customer == customer }
  end
end
