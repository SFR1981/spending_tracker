 require_relative('../models/tag')
 require_relative('../models/merchant')
 require_relative('../models/transaction')

require('pry')



# Transaction.delete_all()
# Merchant.delete_all()
 Tag.delete_all()
 Merchant.delete_all()

#create new merchants
merchant1 = Merchant.new({"id" => 1, "name" => "CDW", "logo" => "/images/logos/CDW.png", "active" => true})
merchant1.save()
merchant2 = Merchant.new({"id" => 2, "name" => "S.h.i.e.l.d", "logo" => "/images/logos/shield.png", "active" => true})
merchant2.save()
merchant3 = Merchant.new({"id" => 3, "name" => "apple", "logo" => "/images/logos/apple.png", "active" => true})
merchant3.save()
merchant4 = Merchant.new({"id" => 4, "name" => "amazon", "logo" => "/images/logos/amazon.png", "active" => true})
merchant4.save()
merchant5 = Merchant.new({"id" => 5, "name" => "McDonalds", "logo" => "/images/logos/McDonalds.png", "active" => true})
merchant5.save()
#save

tag1 = Tag.new({ "name" => "Travel"})
tag2 = Tag.new({ "name" => "Entertainment"})
tag3 = Tag.new({ "name" => "Drinks"})
tag4 = Tag.new({ "name" => "none"})
tag5 = Tag.new({ "name" => "hobby"})


tag1.save()
tag2.save()
tag3.save()
tag4.save()
tag5.save()

transaction1 = Transaction.new({"id" => 1, "merchant_id" => merchant4.id, "tag_id" => tag1.id, "value" => "1299", "reference" => "train tickets", "time_stamp" => '2017-03-11 12:30:02'})
transaction2 = Transaction.new({"id" => 2, "merchant_id" => merchant2.id, "tag_id" => tag2.id, "value" => "12301", "reference" => "train tickets", "time_stamp" => '2018-01-19 14:39:07'})
transaction3 = Transaction.new({"id" => 3, "merchant_id" => merchant5.id, "tag_id" => tag2.id, "value" => "500", "reference" => "partying", "time_stamp" => "#{Time.now}"})

transaction1.save()
transaction2.save()
transaction3.save()

binding.pry
nil
