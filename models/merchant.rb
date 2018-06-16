require_relative('../db/sql_runner')


class Merchant
  attr_reader :id
  attr_accessor :name, :logo, :active

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @logo = options['logo']
    @active = options['active']



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




  def self.all()
    sql = "SELECT * FROM merchants"
    merchants = SqlRunner.run( sql )
    result = merchants.map { |merchant| Tag.new( merchant  ) }
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


end
