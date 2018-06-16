 require_relative('../models/tag')
# require_relative('../models/')
# require_relative('../models/')
require('pry')
require('emojis') #i'm up to something
@emojis = Emojis.new
# Transaction.delete_all()
# Merchant.delete_all()
 Tag.delete_all()

#create new merchants
#save
#create new tags
tag1 = Tag.new({ "name" => "Travel", "icon" => @emojis[:airplane]})
tag2 = Tag.new({ "name" => "Entertainment", "icon" => @emojis[:smiling_face_with_open_mouth_and_smiling_eyes]})
tag1.save()
tag2.save()
#create new transactions
#save

binding.pry
nil
