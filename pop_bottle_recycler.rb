require 'pry'

@empty_bottles = 0
@bottle_caps = 0
@free_bottles = 0

# Iterative method
def redeemed_bottles_iteration
  x = 1
  while x == 1
    puts "How much would you like to spend, in dollars?"
    investment = gets.chomp

    if investment == 'quit'
      x -= 1
    elsif (investment == /[a-z]*/) || (investment.to_i < 0)
      puts "That is not a valid amount. Please insert positive numbers only (ex. 10)"
    else
      purchased_bottles = investment.to_i / 2
      bottle_caps = @bottle_caps + purchased_bottles
      empty_bottles = @empty_bottles + purchased_bottles

      free_from_bottle_recycling = (empty_bottles / 2).floor
      free_from_cap_recycling = (bottle_caps / 4).floor

      @empty_bottles = (empty_bottles % 2)
      @bottle_caps = (bottle_caps % 4)
      @free_bottles += free_from_cap_recycling + free_from_bottle_recycling
    
      puts "\nFor \$#{investment}, you will get #{purchased_bottles} bottles of pop. When you return these empty bottles plus your remaining bottles from last time, you will get #{free_from_bottle_recycling} free bottles and when you return these used bottle caps plus your remaining bottle caps from last time, you will get #{free_from_cap_recycling} free bottles. \n\n" 
      puts "You now have #{@empty_bottles} empty bottles and #{@bottle_caps} bottle caps. You have redeemed a total of #{@free_bottles} free bottles. \n\n"
    end
  end
end

# binding.pry
redeemed_bottles_iteration

@empty_bottles = 0
@bottle_caps = 0
@free_bottles = 0

# Recursive method
def redeemed_bottles_recursive
  puts "How much would you like to spend, in dollars?"
  investment = gets.chomp

  if investment == 'quit'
    return
  elsif (investment == /[a-z]*/) || (investment.to_i < 0)
    puts "That is not a valid amount. Please insert positive numbers only (ex. 10)"
  else
    purchased_bottles = investment.to_i / 2
    bottle_caps = @bottle_caps + purchased_bottles
    empty_bottles = @empty_bottles + purchased_bottles

    free_from_bottle_recycling = (empty_bottles / 2).floor
    free_from_cap_recycling = (bottle_caps / 4).floor

    @empty_bottles = (empty_bottles % 2)
    @bottle_caps = (bottle_caps % 4)
    @free_bottles += free_from_cap_recycling + free_from_bottle_recycling
  
    puts "\nFor \$#{investment}, you will get #{purchased_bottles} bottles of pop. When you return these empty bottles plus your remaining bottles from last time, you will get #{free_from_bottle_recycling} free bottles and when you return these used bottle caps plus your remaining bottle caps from last time, you will get #{free_from_cap_recycling} free bottles. \n\n" 
    puts "You now have #{@empty_bottles} empty bottles and #{@bottle_caps} bottle caps. You have redeemed a total of #{@free_bottles} free bottles. \n\n"
    redeemed_bottles_recursive
  end
end

redeemed_bottles_recursive