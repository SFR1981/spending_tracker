require_relative('../db/sql_runner')
require_relative('./transaction.rb')


class Merchant
  attr_reader :id
  attr_accessor :name, :logo, :active

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @logo = options['logo'] if options['logo']
    @active = options['active']
    uploaded = false



  end

  def save()
    sql = "INSERT INTO merchants
    (name, logo, active )
          VALUES
    ( $1, $2, $3 )
    RETURNING *"
    values = [@name, @logo, @active]
    merchant_data = SqlRunner.run(sql, values)
    @id = merchant_data.first()['id'].to_i

  end


def update()
  sql = "UPDATE merchants SET (name, logo, active)
   = ($1, $2, $3)
  WHERE id = $4"
  values = [@name, @logo, @active, @id]
  SqlRunner.run( sql, values )

end

def delete()
  sql = "DELETE FROM merchants
  WHERE id = $1"
  values = [@id]
  SqlRunner.run( sql, values )


end



def self.all()
  sql = "SELECT * FROM merchants"
  merchants = SqlRunner.run( sql )
  result = merchants.map { |merchant| Merchant.new( merchant  ) }
  return result
end




def self.delete_all()
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)

end

def self.find(id)
  sql = "SELECT * FROM merchants WHERE id = $1"
  values = [id]
  merchant = SqlRunner.run( sql, values )
  result = Merchant.new( merchant.first )
  return result


end

def self.find_name(name)
  sql = "SELECT * FROM merchants WHERE name = $1"
  values = [name]
  merchant = SqlRunner.run( sql, values )
  result = Merchant.new( merchant.first )
  return result

end

def transactions()
  sql = "SELECT transactions.* FROM transactions INNER JOIN merchants ON transactions.merchant_id = merchants.id WHERE merchants.id = $1"
  values= [@id]
  transactions = SqlRunner.run(sql, values)
  result = transactions.map { |transaction| Transaction.new( transaction  ) }
end

def safe_delete()
  transactions = self.transactions()
  for transaction in transactions do
    transaction.merchant_id = nil
    transaction.update
  end
  self.delete()
end

def total_spend

total_value = 0
for transaction in self.transactions
 total_value += transaction.value()
end
 return total_value
end
#

def percentage_of_spending
 total = Transaction.total_spend().to_i
 for_this_tag = self.total_spend().to_i
 percentage = ( for_this_tag * 100.0 )/ total
 return percentage.round(2)

end
#





end
