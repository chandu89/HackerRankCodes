class Fus 
	# I am using readlines so that in future we can process .large files.
	def process_soccer
   # add file_path url
		file_path = path
		output = File.open(file_path).readlines.first.split("\r")
		h = Hash.new
		output.each do |o|
			split_by_team = o.split(" - ")
			first_team_score = split_by_team.first.split(//).map {|x| x[/\d+/]}.compact.join("").to_i
			second_team_score = split_by_team.last.split(//).map {|x| x[/\d+/]}.compact.join("").to_i
			first_team_name = split_by_team.first.split(" #{first_team_score}").first.strip
			second_team_name = split_by_team.last.split(" #{second_team_score}").first.strip
			h[second_team_name] = Hash.new if h[second_team_name].nil?
			h[first_team_name] = Hash.new  if h[first_team_name].nil?
			if first_team_score > second_team_score
				h = assigned_points(h, first_team_name, second_team_name, 'win')
			elsif second_team_score > first_team_score
				h = assigned_points(h, first_team_name, second_team_name, 'loss')
			else
				h = assigned_points(h, first_team_name, second_team_name, 'draw')
			end
		end
		h = h.sort_by{|key,val| val["points"]}.reverse
		puts h
	end

	def assigned_points(h ={}, t1, t2, result)
		flag = (h[t1]['points'].nil? ? true :  false)
		flag_for_second_team = (h[t2]['points'].nil? ? true :  false)
		case result
		when 'draw'
			if flag
				h[t1]['points'], h[t1]['draw'], h[t1]['win'], h[t1]['loss'], h[t1]['played']= 1 ,1, 0, 0, 1
			else
				h[t1]['points'] += 1
				h[t1]['draw'] += 1 
				h[t1]['played'] +=1
			end
			if flag_for_second_team
				h[t2]['points'], h[t2]['draw'], h[t2]['win'], h[t2]['loss'], h[t2]['played']= 1 ,1, 0, 0, 1
			else
				h[t2]['points'] += 1
				h[t2]['draw'] += 1
				h[t2]['played'] +=1
			end
		when 'win'
			if flag
				h[t1]['points'], h[t1]['draw'], h[t1]['win'], h[t1]['loss'], h[t1]['played']= 3 ,0, 1, 0, 1
			else
				h[t1]['points'] += 3
				h[t1]['win'] += 1 
				h[t1]['played'] +=1
			end
			if flag_for_second_team
				h[t2]['points'], h[t2]['draw'], h[t2]['win'], h[t2]['loss'], h[t2]['played']= 0 ,0, 0, 1, 1
			else
				h[t2]['loss'] += 1
				h[t2]['played'] +=1
			end
		else
			if flag
				h[t1]['points'], h[t1]['draw'], h[t1]['win'], h[t1]['loss'], h[t1]['played']= 0 ,0, 0, 1, 1
			else
				h[t1]['loss'] +=1 
				h[t1]['played'] +=1
			end
			if flag_for_second_team
				h[t2]['points'], h[t2]['draw'], h[t2]['win'], h[t2]['loss'], h[t2]['played']= 3 ,0, 1, 0, 1
			else
				h[t2]['win'] += 1 
				h[t2]['points'] += 3
				h[t2]['played'] +=1
			end
		end
		h
	end

end
Fus.new.process_soccer
