class BankAccount
  
  attr_reader :name
  
  def initialize(name)
    @name=name
    @transactions=[]
    add_transaction("beginning balance", 0)
    
  end
  
  def credit(description , amount)
    add_transaction(description, amount)
  end
  
  def debit(description, amount)
     add_transaction(description, -amount)
  end
  
  def add_transaction(description , amount)
    @transactions.push({description: description, amount: amount})
  end
  
  def balance
    balance = 0.0
    @transactions.each do |key|
      balance += key[:amount]
    end
    return balance
  end
  
  def to_s
      "Name: #{name}, Balance: #{sprintf("%0.2f", balance)}"
      #sprintf is to convert number into 2 decimal 60.00
  end

  def print_register
    puts "#{name}'s Bank Account"
    puts "-" * 40
    
    puts "Description".ljust(30) + "Amount".rjust(10)
    @transactions.each do |key|
    puts key[:description].ljust(30) +sprintf("%0.2f",key[:amount]).rjust(10)
    end
    
    #rjust will create space from left to right
    #ljust will create space from right to left
    #doc https://apidock.com/ruby/v1_9_3_392/String/ljust
    
    puts "-" * 40
    puts "Balance:".ljust(30)+ sprintf("%0.2f",balance).rjust(10)
    puts "-" * 40
  end 
  
end

bank_account = BankAccount.new("hao")
puts bank_account.credit("paycheck", 100)
bank_account.debit("groceries" , 40)
bank_account.debit("gas", 10.51)
puts bank_account
puts "register:"
bank_account.print_register