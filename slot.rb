total_coin = 100
total_point = 0

while total_coin >= 10  do
  
  puts "----------------------"
  puts "残りコイン数 #{total_coin}"
  puts "ポイント #{total_point}"
  puts "何コイン入れますか?"
  
  ########################ベットするコイン数##############################
  if total_coin >= 50 then
    puts "1(10コイン) 2(30コイン) 3(50コイン) 4(やめとく)"
    bet_coins = [10,30,50]
  elsif total_coin >= 30 then
    puts "1(10コイン) 2(30コイン) 4(やめとく)"
    bet_coins = [10,30]
  else
    puts "1(10コイン) 4(やめとく)"
    bet_coins = [10]
  end
  
  puts "----------------------"
  
  choice = gets.chomp.to_i - 1
  
  if choice == -1 then
    puts "入力してください"
  elsif bet_coins[choice] then
    
    total_coin -= bet_coins[choice]
    
    num1 = rand(9)
    num2 = rand(9)
    num3 = rand(9)
    num4 = rand(9)
    num5 = rand(9)
    num6 = rand(9)
    num7 = rand(9)
    num8 = rand(9)
    num9 = rand(9)
    puts "エンターを3回押しましょう"
  ########################スロットスタート##############################
    puts = gets
    puts "----------------------"
    puts "|#{num1}|||"
    puts "|#{num2}|||"
    puts "|#{num3}|||"
    puts "----------------------"
    puts = gets
    puts "----------------------"
    puts "|#{num1}|#{num4}||"
    puts "|#{num2}|#{num5}||"
    puts "|#{num3}|#{num6}||"
    puts "----------------------"
    puts = gets
    puts "----------------------"
    puts "|#{num1}|#{num4}|#{num7}|"
    puts "|#{num2}|#{num5}|#{num8}|"
    puts "|#{num3}|#{num6}|#{num9}|"
    puts "----------------------"
    
    ########################スロットが揃った時##############################
    
    def slot_hit(line,num)
      puts "#{line}に#{num}が揃いました!"
      puts "500ポイント獲得!"
    end
    
    if num1 == num4 && num4 == num7  then
      slot_hit("上",num1)
      case_pattern = "１列揃う"
    elsif num2 == num5 && num5 == num8 then
      slot_hit("真ん中",num2)
      case_pattern = "１列揃う"
    elsif num2 == num5 && num5 == num8 then
     slot_hit("下",num3)
     case_pattern = "１列揃う"
    elsif num1 == num5 && num5 == num9 then
      slot_hit("ナナメ",num1)
      case_pattern = "１列揃う"
    elsif num3 == num5 && num5 == num7 then
      slot_hit("ナナメ",num3) 
      case_pattern = "１列揃う"
    else
      case_pattern = "揃わなかった"
    end
    
    case case_pattern
      when "１列揃う"
        coin_bonus = bet_coins[choice] * 50
        total_coin += coin_bonus
        puts "#{coin_bonus}コイン獲得"
        total_point += 500
      when "揃わなかった"
        puts "残念"
    end
  ########################スロットを断った時##############################
  elsif choice == 3 then
    puts "ケチんぼ"
    break
  else
    puts "入力が間違っています"
  end

end

########################コインがなくなった時##############################
if total_coin == 0 then
  puts "コインがなくなりました"
end