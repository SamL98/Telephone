require ‘csv’
ActiveRecord::Base.logger.level = 1
users = ['user01', 'user04', 'user07', 'user10', 'user13', 'user16', 'user19', 'user22', 'user25', 'user28', 'user31', 'user34', 'user49', 'user50', 'user52', 'user53', 'user55', 'user56', 'user58', 'user59', 'user61', 'user62', 'user64', 'user65', 'user67', 'user70', 'user73', 'user76', 'user79', 'user82', 'user85', 'user88', 'user91', 'user94', 'user71']
Chain.all.each do |c|
	c.passages.all.each do |p|
               if p.derivation > 1
                        if users.include? p.user
				data = [p.user, c.identifier, p.passage_id, p.number, p.text, p.derivation, p.time_spent]
				print data.to_csv
				puts ‘’
			end
		end
	end
end
