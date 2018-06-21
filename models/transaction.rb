require_relative('../db/sql_runner')
require('time')



class Transaction
  attr_reader :id
  attr_accessor :merchant_id, :tag_id, :value, :reference, :time_stamp

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id']
    @tag_id = options['tag_id']
    @value = options['value'].to_i
    @reference = options['reference'] if options['reference']
    @time_stamp = options['time_stamp']
  end

def save()
  sql = "INSERT INTO transactions
  (merchant_id, tag_id, value, reference, time_stamp )
        VALUES
  ( $1, $2, $3, $4, $5 )
  RETURNING *"
  values = [@merchant_id, @tag_id, @value, @reference, @time_stamp]
  transaction_data = SqlRunner.run(sql, values)
  @id = transaction_data.first()['id'].to_i
end

def value_to_pounds()
  return "#{@value / 100.0}"
end

def delete()
  sql = "DELETE FROM transactions
  WHERE id = $1"
  values = [@id]
  SqlRunner.run( sql, values )

end

def time()
  Time.parse(@time_stamp)
end

def update()
  sql = "UPDATE transactions SET (merchant_id, tag_id, value, reference, time_stamp)
   =
  (
    $1, $2, $3, $4, $5
  )
  WHERE id = $6"
  values = [@merchant_id, @tag_id, @value, @reference, @time_stamp, @id]
  SqlRunner.run( sql, values )
end



def self.all()
    sql = "SELECT * FROM transactions"
  transactions = SqlRunner.run( sql )
  result = transactions.map { |transaction| Transaction.new(transaction) }
  return result
end

def self.delete_all()
  sql = "DELETE FROM transactions"
  SqlRunner.run(sql)
end

def self.find(id)
  sql = "SELECT * FROM transactions WHERE id = $1"
  values = [id]
  transaction = SqlRunner.run( sql, values )
  result = Transaction.new( transaction.first )
  return result

end

def self.total_spend()
sql = "SELECT SUM(value) FROM transactions"
total = SqlRunner.run(sql)
number = total.first()["sum"].to_f() / 100
return number.round(2)

end

def self.order_by_newest
sql = "SELECT * FROM transactions ORDER BY time_stamp DESC"
most_recent = SqlRunner.run(sql)
result = most_recent.map { |transaction| Transaction.new( transaction  ) }
return result

end

def self.order_by_highest()
sql = "SELECT * FROM transactions ORDER BY value desc"
highest = SqlRunner.run(sql)
result = highest.map { |transaction| Transaction.new( transaction  ) }
return result
end



def self.order_by_oldest()
sql = "SELECT * FROM transactions ORDER BY time_stamp"
oldest = SqlRunner.run(sql)
result = oldest.map { |transaction| Transaction.new( transaction  ) }
return result
end

def self.yesterday()
  sql = "select * from transactions where DATE(time_stamp) = DATE(NOW())"
  today = SqlRunner.run(sql)
  result = today.map { |transaction| Transaction.new( transaction  ) }
  return result
end

def self.yesterday_total()
  total = 0
    for transaction in self.yesterday()
      total += transaction.value()
    end
    number = (total.to_f() / 100).round(2)
    return "£#{number}"
end

def self.last_week()
  a_week_ago = Time.now() - (60*60*24*7)
  sql = "SELECT * FROM transactions ORDER BY time_stamp"
  oldest = SqlRunner.run(sql)
  result = oldest.map { |transaction| Transaction.new( transaction )if Time.parse(transaction["time_stamp"]) > a_week_ago }
  return result.compact
end

def self.last_week_total()
  total = 0
    for transaction in self.last_week()
      total += transaction.value()
    end
    number = (total.to_f() / 100).round(2)
    return "£#{number}"
end

def self.last_month()
  a_month_ago = Time.now() - (60*60*24*7*4)
  sql = "SELECT * FROM transactions ORDER BY time_stamp"
  oldest = SqlRunner.run(sql)
  result = oldest.map { |transaction| Transaction.new( transaction )if Time.parse(transaction["time_stamp"]) > a_month_ago }
  return result.compact
end

def self.last_month_total()
  total = 0
    for transaction in self.last_month()
      total += transaction.value()
    end
    number = (total.to_f() / 100).round(2)
    return "£#{number}"
end


end
