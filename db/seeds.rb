 require_relative('../models/tag')
 require_relative('../models/merchant')
 require_relative('../models/transaction')

require('pry')



# Transaction.delete_all()
# Merchant.delete_all()
 Tag.delete_all()
 Merchant.delete_all()

#create new merchants
merchant1 = Merchant.new({"id" => 1, "name" => "CDW", "logo" => "./images/logos/CDW.png", "active" => true})
merchant1.save()
#save
#create new tags
tag1 = Tag.new({ "name" => "Travel"})
tag2 = Tag.new({ "name" => "Entertainment"})
tag3 = Tag.new({ "name" => "Drinks"})
tag1.save()
tag2.save()
tag3.save()

transaction1 = Transaction.new({"id" => 1, "merchant_id" => merchant1.id, "tag_id" => tag1.id, "value" => 1299, "reference" => "train tickets"})
transaction2 = Transaction.new({"id" => 1, "merchant_id" => merchant1.id, "tag_id" => tag1.id, "value" => 1200, "reference" => "train tickets"})

transaction1.save()
transaction2.save()

binding.pry
nil
