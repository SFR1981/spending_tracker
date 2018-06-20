class TagStats

  attr_reader :tag_id, :amount


  def initialize(options)
    @tag_id = options['tag_id']
    @amount = options['amount']

  end



end
