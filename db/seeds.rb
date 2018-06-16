 require_relative('../models/tag')
 require_relative('../models/merchant')
 require_relative('../models/transaction')
require('pry')
require('emojis') #i'm up to something
@emojis = Emojis.new
# Transaction.delete_all()
# Merchant.delete_all()
 Tag.delete_all()
 Merchant.delete_all()

#create new merchants
merchant1 = Merchant.new({"id" => 1, "name" => "CDW", "logo" => "/images/1.png", "active" => true})
merchant1.save()
#save
#create new tags
tag1 = Tag.new({ "name" => "Travel", "icon" => @emojis[:airplane]})
tag2 = Tag.new({ "name" => "Entertainment", "icon" => @emojis[:smiling_face_with_open_mouth_and_smiling_eyes]})
tag1.save()
tag2.save()

transaction1 = Transaction.new({"id" => 1, "merchant_id" => merchant1.id, "tag_id" => tag1.id, "value" => 1299, "reference" => "train tickets"})

transaction1.save()

binding.pry
nil
