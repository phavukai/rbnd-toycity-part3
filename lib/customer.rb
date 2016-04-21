class Customer
  attr_reader :name

  @@customers = []

  def initialize(options={})
    @name = options[:name]
    add_to_customers
  end

  def self.all
    @@customers
  end

  def self.find_by_name(name)
    @@customers.find { |customer| customer.name == name }
  end

  def add_to_customers
    raise DuplicateCustomerError, "'#{name}' already exists." if @@customers.find { |customer| customer.name == name }
    @@customers << self
  end

  def purchase(product)
    raise OutOfStockError, "'#{product.title}' is out of stock." unless product.in_stock?
    Transaction.new(self, product) 
  end

  def self.list_customers
    puts "--------CUSTOMER LIST--------------------"
    @@customers.each {|name| puts "#{name.name}"  }
    puts "-----------------------------------------"
  end

  def return(product)
    Transaction.new(self, product, false)
  end
end
