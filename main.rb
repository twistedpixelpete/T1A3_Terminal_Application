
require 'byebug'
require 'tty-prompt'
require 'colorize'
require_relative './lib/activity'
require_relative './lib/interface'

whats_on = Activity.new
interface = Interface.new 
prompt = TTY::Prompt.new
favs = []
sorted_favs = []



# puts whats_on.today_activities[0][:title]
whats_on.display_today_activity_name

# # File.open("./data/favorites.txt").each do |line|
# #     favs << line
# # end


    
    
# end

# def today_menu(prompt, interface, whats_on, list, favs, main_menu) 

#     interface.title_block("Check out whats on today!")
    
#     whats_on.melb_list_today

#     chosen_activity = prompt.select("\nSelect an activity to find out more\n", whats_on.list.push({name: "--Go Back to Menu--", value: 11}).uniq)
    

      
#     if  chosen_activity <= 10
#         puts whats_on.today_activities[chosen_activity-1][:description]
        
#         puts

#         option = prompt.select("What next?") do |menu|
#             menu.choice "Add to favorites", 1
#             menu.choice "Go Back".blue, 2
#             end
        
#             if option == 1
#                 favs << whats_on.list[chosen_activity-1][:name]
#                 # File.open("./data/favorites.txt", "a") do |file|
#                 #     file.puts "#{whats_on.list[chosen_activity-1][:name]}"
                    
#                 end

#                 puts "Done!\n#{whats_on.list[chosen_activity-1][:name]} added to favorites!".light_green

#                 option2 = prompt.select("") do |menu|
#                     menu.choice "Go Back".blue, 1
#                     end
#                     if option2 == 1
#                         today_menu(prompt, interface, whats_on, list, favs, main_menu)
#                     end

                
#             else
#                 today_menu(prompt, interface, whats_on, list, favs, main_menu)
#             end

        
#         else                    
#     end
# end

# def sort_favs(favs, sorted_favs)

#         i=0
#         while i < favs.length
               
#             bob = {name: favs[i], value: i+1.to_i}

#             sorted_favs << bob

#                 i += 1     
#         end
    
# end





# def favorites_list(prompt, interface, whats_on, favs, sorted_favs)
#     system 'clear'
#     interface.title_block("My Favorites")
#     if favs.length == 0
#         puts "You have no favorites!"
#     end
#     favs.uniq
#     File.open("./data/favorites.txt").each do |line|
#         puts line
#     end
#     sort_favs(favs, sorted_favs)
    
    

#     delete_option = prompt.select("\nSelect to delete or EXIT to main menu\n", sorted_favs.push({name: "--EXIT--", value: 11}).uniq)
      
#     if delete_option <= sorted_favs.length-1
#         sorted_favs.delete_at(delete_option)
#         favs.delete_at(delete_option)
        
#         puts "top one "
#         puts favs
#         gets
        
#     else
#        puts  "bottom one"
       
#         gets
#     end

# end
    




# main_menu = true
#     while  main_menu == true
#         interface.welcome
#          prompt.select("What would you like to do?") do |menu|
#             menu.choice "Check out what's on today", -> {today_menu(prompt, interface, whats_on, whats_on.list, favs, main_menu)} 
#             menu.choice "Check out things to do on the weekend", -> { melb_list_weekend(prompt, interface, whats_on) }
#              menu.choice "Look at my favorites", -> { favorites_list(prompt, interface, whats_on, favs, sorted_favs) }
#             menu.choice "Exit", -> { interface.leave_app }    
#             end  
#     end   





# def leave_section(prompt, interface, whats_on)
#     interface.welcome
#     main_menu(prompt, interface, whats_on)
    
# end



    







    









