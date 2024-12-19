
class Player
  attr_accessor :name, :score

  def initialize(name)
    @name = name.upcase
    @score = 0
  end  

  def add_points(points)
    @score += points
    puts "#{@name}, v penazenke mas #{@score} bodov!"
  end

  def display_details
    puts "Hrac: #{@name}, Skore: #{@score}"
  end
end

@player = nil

#choose game
def choose_game
  puts "ktoru hru chces hrat?"
  puts "1 - spocitaja palicky"
  puts "2 - urci vacsie cislo"
  puts "3 - sucet cisel do 6"
  puts "4 - Najdi chybajuce cislo"
  puts "5 - zisti aktualne score"
  user_selection = gets.chomp
  
    case user_selection
      when "1"
        count_sticks
      when "2"
        higher_number
      when "3"
        count_number  
      when "4"
        find_number 
      when "5"    
        @player.display_details
        continue
      else
        continue
    end
  
  end


#1 - count sticks
def rand_sticks(max: 5)
  stick_number = rand(max)
  stick_number.times do
     print "| "
  end
  
  puts ' '
  return stick_number
end

def count_sticks
  puts "Spocitaj kolko vidis paliciek?"
  correct_ans = rand_sticks
 
  puts "Moja odpoved je:"
  provided_ans = gets.chomp.to_i

  check_answer(correct_ans, provided_ans)
  continue
end  

#2 - define higher number
def higher_number(max: 5)
   num_1 = rand(max)
   num_2 = rand(max)

   puts "Ktore cislo je vacsie #{num_1} alebo #{num_2} ?"
   puts "Moja odpoved je:"
  provided_ans = gets.chomp.to_i
  correct_ans = [num_1, num_2].max 
   
  check_answer(correct_ans, provided_ans) 
  continue
end

#3 - sum of two numbers
def count_number(max: 6)
num_1 = nil
num_2 = nil
sum = nil

  loop do 
    num_1 = rand(max)
    num_2 = rand(max)
    sum = num_1 + num_2
    break if sum < 7
  end
  
  puts "Vypocitaj priklad #{num_1} + #{num_2} ="
  puts "Moja odpoved je:"
  provided_ans = gets.chomp.to_i

  check_answer(sum, provided_ans)
  continue
end

#4 - number series
def find_number(max: 6)
  series = (1..max).to_a
  secret_num = series.sample(1)
  correct_ans = secret_num[0]

  puts "Najdi chybajuce cislo v rade:"
  puts series.map{|num| secret_num.include?(num) ? "_" : num }.join(" ")

  puts "Moja odpoved je:"  
  provided_ans = gets.chomp.to_i

  check_answer(correct_ans, provided_ans)
  continue

end

#check answer
def check_answer(correct, provided)

    if correct == provided
      @player.add_points(1)
      puts "jupiii, tvoja odpoved je spravna!"
    else
      puts "O-ou, niekde sa stala chyba.Spravna odpoved je #{correct}. Nevadi, skus to este raz"
    end
  
end

#start new game
def continue
  puts "chces sa opat zahrat? Ak ano napis Y, ak nie daj E"
  ans = gets.chomp.upcase
  if ans == "Y"
    choose_game
  else
    exit
  end
end

#welcome
p "Ahoj, ako sa volas?"
player_name = gets.chomp
@player = Player.new(player_name)
p "Ahoj #{@player.name} podme sa zahrat!"

choose_game


