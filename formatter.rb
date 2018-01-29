require ‘csv’
ActiveRecord::Base.logger.level = 1
users = []
[1..96].each do |i|
	user_no = i.to_s
	if user_no.length < 2
		user_no = "0" + user_no
	end
	users << user_no
end
Chain.all.each do |c|
	c.passages.all.each do |p|
               if p.derivation > 1
                        if users.include? p.user
				data = [p.user, c.identifier, p.passage_id, p.number, p.text, p.derivation, p.time_spent, p.text.split.size]
				print data.to_csv
				puts ‘’
			end
		end
	end
end
