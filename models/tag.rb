require_relative('../db/sql_runner')
require_relative('./tag_stats')


class Tag

  attr_reader :id
  attr_accessor :name

  def initialize( options )

    @id = options['id'].to_i if options['id'] != nil
    @name = options['name']

  end


  def save()
    sql = "INSERT INTO tags (name)  VALUES ($1)

    RETURNING *"
    values = [@name]
    tag_data = SqlRunner.run(sql, values)
    @id = tag_data.first()['id'].to_i
  end

def delete()
  sql = "DELETE FROM tags
  WHERE id = $1"
  values = [@id]
  SqlRunner.run( sql, values )
end

  def update()
    sql = "UPDATE tags SET name
     =

      $1

    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run( sql, values )


  end



  def self.all()
    sql = "SELECT * FROM tags"
    tags = SqlRunner.run( sql )
    result = tags.map { |tag| Tag.new( tag  ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [id]
    tag = SqlRunner.run( sql, values )
    result = Tag.new( tag.first )
    return result

  end

def transactions
  sql = "SELECT transactions.* FROM transactions INNER JOIN tags ON transactions.tag_id = tags.id WHERE tags.id = $1"
  values= [@id]
  transactions = SqlRunner.run(sql, values)
  result = transactions.map { |transaction| Transaction.new( transaction  ) }

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
  percentage = ( for_this_tag  )/ total
  return percentage.round(2)

end


def self.by_tag()
tag_hash_array = []
sql = "SELECT tag_id, sum(value) AS amount from transactions group by tag_id"
values = SqlRunner.run(sql)
@results = values.map { |tag_stats| TagStats.new( tag_stats ) }



end






def safe_delete
  transactions = self.transactions()
  for transaction in transactions do
    transaction.tag_id = nil
    transaction.update
  end
  self.delete()

end



end
