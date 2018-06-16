require_relative('../db/sql_runner')
require('emojis')

class Tag

  attr_reader :id
  attr_accessor :name, :icon

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

  def delete()
    sql = "DELETE FROM tags
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )

  end

  def update()
    sql = "UPDATE tags SET (name, icon)
     =
    (
      $1, $2
    )
    WHERE id = $3"
    values = [@name, @icon, @id]
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


end
