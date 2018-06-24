 require_relative('../models/tag')
 require_relative('../models/merchant')
 require_relative('../models/transaction')

require('pry')



# Transaction.delete_all()
# Merchant.delete_all()
 Tag.delete_all()
 Merchant.delete_all()

#create new merchants
merchant1 = Merchant.new({"id" => 1, "name" => "JDW", "logo" => "/images/logos/pub.jpeg", "active" => true})
merchant1.save()
merchant2 = Merchant.new({"id" => 2, "name" => "S.h.i.e.l.d", "logo" => "/images/logos/shield.png", "active" => true})
merchant2.save()
merchant3 = Merchant.new({"id" => 3, "name" => "apple", "logo" => "/images/logos/apple.png", "active" => true})
merchant3.save()
merchant4 = Merchant.new({"id" => 4, "name" => "amazon", "logo" => "/images/logos/amazon.png", "active" => true})
merchant4.save()
merchant5 = Merchant.new({"id" => 5, "name" => "McDonalds", "logo" => "/images/logos/McDonalds.png", "active" => true})
merchant5.save()
merchant6 = Merchant.new({"id" => 6, "name" => "Quick Adds", "logo" => "/images/logos/money.jpeg", "active" => true})
merchant6.save
#save

tag1 = Tag.new({ "name" => "None"})
tag2 = Tag.new({ "name" => "Entertainment"})
tag3 = Tag.new({ "name" => "Alcohol"})
tag4 = Tag.new({ "name" => "Groceries"})
tag5 = Tag.new({ "name" => "Hobby"})
tag6 = Tag.new({ "name" => "Charity"})
tag7 = Tag.new({ "name" => "Smoking"})
tag8 = Tag.new({ "name" => "Tech"})



tag1.save()
tag2.save()
tag3.save()
tag4.save()
tag5.save()
tag6.save()
tag7.save()
tag8.save()

transaction1 = Transaction.new({"id" => 1, "merchant_id" => merchant4.id, "tag_id" => tag2.id, "value" => "1299", "reference" => "books", "time_stamp" => '2018-05-27 12:30:02'})
transaction2 = Transaction.new({"id" => 2, "merchant_id" => merchant6.id, "tag_id" => tag3.id, "value" => "12301", "reference" => "beers and alcohol", "time_stamp" => '2018-01-19 14:39:07'})
transaction3 = Transaction.new({"id" => 3, "merchant_id" => merchant1.id, "tag_id" => tag3.id, "value" => "7000", "reference" => "partying", "time_stamp" => "#{Time.now}"})
transaction4 = Transaction.new({"id" => 4, "merchant_id" => merchant5.id, "tag_id" => tag4.id, "value" => "500", "reference" => "nugz", "time_stamp" => "2018-06-15 22:19:54"})
# transaction5 = Transaction.new({"id" => 5, "merchant_id" => merchant3.id, "tag_id" => tag4.id, "value" => "43800", "reference" => "phone", "time_stamp" => "2018-06-10 22:19:54"})
transaction6 = Transaction.new({"id" => 6, "merchant_id" => merchant3.id, "tag_id" => tag8.id, "value" => "200000", "reference" => "laptop", "time_stamp" => "2018-06-05 22:19:54"})
transaction7 = Transaction.new({"id" => 7, "merchant_id" => merchant6.id, "tag_id" => tag7.id, "value" => "2000", "reference" => "new battery", "time_stamp" => "2018-03-15 22:19:54"})
transaction8 = Transaction.new({"id" => 8, "merchant_id" => merchant4.id, "tag_id" => tag8.id, "value" => "2349", "reference" => "new battery", "time_stamp" => "2017-02-25 22:19:54"})
transaction9 = Transaction.new({"id" => 9, "merchant_id" => merchant4.id, "tag_id" => tag8.id, "value" => "10999", "reference" => "special watch that doesn't work", "time_stamp" => "2018-01-01 22:19:54"})
transaction10 = Transaction.new({"id" => 10, "merchant_id" => merchant2.id, "tag_id" => tag8.id, "value" => "55099", "reference" => "rental: flying car", "time_stamp" => "2018-02-14 22:19:54"})

transaction1.save()
transaction2.save()
transaction3.save()
transaction4.save()
# transaction5.save()
transaction6.save()
transaction7.save()
transaction8.save()
transaction9.save()
transaction10.save()

binding.pry
nil
