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



end
