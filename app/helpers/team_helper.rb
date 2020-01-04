module TeamHelper
	def getColor index
		x = index % 4
		arr = ["team-skyblue", "team-red", "team-blue", "team-green"]
		arr[x]
	end

	def getInitial str=""
		str[0].capitalize
  end		
end