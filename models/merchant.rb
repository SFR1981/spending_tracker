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



end
