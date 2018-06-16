 require_relative('../models/tag')
# require_relative('../models/')
# require_relative('../models/')
require('pry')
require('emojis') #i'm up to something
@emojis = Emojis.new
# Transaction.delete_all()
# Merchant.delete_all()
# Tag.delete_all()

#create new merchants
#save
#create new tags
tag1 = Tag.new({ "name" => "Travel", "icon" => @emojis[:airplane]})
tag1.save()
#create new transactions
#save

binding.pry
nil
