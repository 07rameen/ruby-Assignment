
#Here I have made functions 

#AliceRank is the function iterating through updated array (includes Alice score ) and updated rank. It will take index of score from newArray and find that index in rank's value

def AliceRank(score,newArray,rank)
    length = rank.length 
    val = newArray.find_index(score)
    testing = rank[val]
    return testing
    
 end
 
 #MakingArray method is simply showing the scores on the leaderboard in descending order 
 
 def MakingArray(scores,n)
     newArray=[]
     newArray=scores.sort.reverse()
     return newArray
     
 end
 
 #Ranking method is only generating a new array named rank and returning it by forming ranks according to the score 
 #it takes first index of first value of our score Array and compares the corresponding value if a duplicate the count will not increment (ie rank goes for 1 to 2) else stays to 1 for example.
 
 def Ranking (newArray)
 count=1
 rank=[]
 index=newArray[0]
 #nested=[count,index]
 
 newArray.each do |i|
     if i<index
         index=i
         count=count+1
         #nested[count] <<  index
     end
     rank.push(count)
 end
 return rank
 end
 
 #input of players in the game and checks the constraints 
 #n=gets.chomp.to_i
 n=0
 loop do
     puts "How many players are playing this game ? Enter value from 1 to 2*10**5"
     n=gets.chomp.to_i
     if n>=1 && n<=2*10**5
         break
     end
 end
 
 newArray=[]
 size=n
 scores=[]
 num=-1
 #here scores are taken for the leader board and constraints are also checked 
 while size>0
     puts "Enter score"
     loop do
         num=gets.chomp.to_i
          if num>=0 && num<=1*10**9
              break
          end
     end
     #num=gets.chomp.to_i
     scores.push(num)
     size=size-1
 end
 newArray=MakingArray(scores,n) #makingArray called and returns an array with scores in descending order 
 
 rank=[]
 rank=Ranking(newArray) #Ranking function called and returns an array with ranks
 
 puts "Data gathered is : "  #just checking if data coming is correct
 puts "#{newArray}"
 puts
 puts "#{rank}"
 
 m=-1
 #asking the player(Alice) how many games she'd like to play and checking constraints 
 loop do
     puts "How many games would you like to play? Enter between 1 to 2*10**5"
     m=gets.chomp.to_i
     if m>=1 && m<=2*10**5
         break
     end
 end
 
 play=m
 game=1
 score=-1
 playerRanking=[]
 while play>0
     puts "Enter score for #{game} game" #checking scores of alice with constraints 
     loop do
          score=gets.chomp.to_i
          if score>=0 && score<=1*10**9
              break
          end
      end
     scores.push(score)
     n=n+1
     newArray=MakingArray(scores,n)
     rank=Ranking(newArray)
     puts "Data gathered (updated)"
     puts "#{newArray}"
     puts
     puts "#{rank}"
     value=AliceRank(score,newArray,rank) #returns only the ranks of Alice
     playerRanking.push(value)
     play=play-1
     game=game+1
 end
 
 #Displaying Ranks of the player for all the games he/she played 
 puts "Your ranks of all the games you played are #{playerRanking}"
     