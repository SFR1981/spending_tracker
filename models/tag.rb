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




end
