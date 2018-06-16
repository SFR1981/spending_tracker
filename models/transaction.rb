require_relative('../db/sql_runner')


class Transaction
  attr_reader :id
  attr_accessor :merchant_id, :tag_id, :value, :reference

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id']
    @tag_id = options['tag_id']
    @value = options['value']
    @reference = options['reference'] if options['reference']



  end



end
