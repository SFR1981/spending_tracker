require_relative('../db/sql_runner')
require('emojis')

class Tag

  attr_reader :id, :name, :icon

  def initialize( options )
    emojis = Emojis.new
    @id = options['id'].to_i
    @name = options['name']
    @icon = options['icon']
  end


  def save()
    sql = "INSERT INTO tags(name, icon )        VALUES
    (
      $1, $2
    )
    RETURNING *"
    values = [@name, @icon]
    tag_data = SqlRunner.run(sql, values)
    @id = tag_data.first()['id'].to_i
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


end
