###### Contact List #####
#------------------
# Basic Objectives
# Build a contact list
# Create a menu that allows a user to select 
# 1) Create a contact 2) View All Contacts 3) Exit
# The menu should loop until the user exits
#-------------------
# Bonus Objectives
# Delete a contact
# Edit a contact
##########################

# Build a contact list

# Create a menu that allows a user to select 
# 1) Create a contact 2) View All Contacts 3) Exit
# The menu should loop until the user exits

# Prepopluate the list so you dont feel lonely!
john_contact = {
    name: "John",
    phone: "801-123-4567",
}

george_contact = {
    name: "George",
    phone: "999-345-3454",
}

@contact_book = [john_contact, george_contact]

#p @contact_book #This is for debugging

#Defining all the functions. 

##################################################

# Print Menu
def print_menu
    puts "Contact Menu"
    puts "1- Create a Contact"
    puts "2- View All Contacts"
    puts "3- Edit a Contact"
    puts "4- Delete a Contact"
    puts "5- Exit"
    puts "Please enter the option"
    
    #Debug mode, displaying the current info in hash. Comment in/out this:
    #p @contact_book
end

#Displaying contact list
def display_contact
    #setting up and formatting based on the hash
    # displayed_contact_list = @contact_book.map do |contact|
    #     "Name: #{contact[:name]} Phone Number: #{contact[:phone]}"
    # end

    # #display the result, with index
    # displayed_contact_list.each_with_index do |contact, index|
    #     puts "[ #{index + 1} ] #{contact}"
    # end

    @contact_book.each_with_index do |contact, index|
        puts "[ #{index + 1} ] Name: #{contact[:name]} Phone: #{contact[:phone]}"        
    end

end

#Create Contact (Need to make sure name and phone number is populated)
def create_contact(name, phonenumber)
    contact = {
        name: "#{name}",
        phone: "#{phonenumber}",
    }
    @contact_book << contact
    #p @contact_book #print confirmation of adding to the hash 
end

#Edit contact name (see edit_contact)
def edit_name(index)
    puts "What name do you want to change it to?"
    new_name = gets.chomp
    @contact_book[index - 1][:name] = new_name
end

#Edit contact phone number (see edit_contact)
def edit_phonenumber(index)
    puts "What phone book do you want to change it to?"
    new_phonenumber = gets.chomp
    @contact_book[index - 1][:phone] = new_phonenumber
end

#Error message for edit_contact
def error_msg
    puts "I am sorry I do not understand your request, please try again!"
end

def edit_contact
    display_contact

    puts "Enter the number you want to edit"
    index = gets.chomp.to_i

    puts "Do you want to change the name? [y/n]"
    namechange = gets.chomp

    if namechange == "y"
            edit_name(index)
        elsif namechange == "n"
            puts "ok, how about this?"
        else
            error_msg
    end

    puts "Do you want to change the phone? [y/n]"
    phonechange = gets.chomp   
    if phonechange == "y"
        edit_phonenumber(index)
    elsif phonechange == "n"
        return
    else
        error_msg
end 


end

#delete contact
def del_contact
    display_contact
    puts "Enter the item you want to delete"
    index = gets.chomp.to_i

    puts "Are you sure? (y/n)"
    del_confirm = gets.chomp
    if del_confirm == "y"
        puts "deleting #{index}"
        @contact_book.delete_at(index - 1)
        # p @contact_book #debug mode <----
    elsif del_confirm == "n"
        puts "The contact has not been deleted"
        return
    else
        error_msg
end

end


def run_app
    print_menu
# Match Case. it will call run_app again at the end. Pressing 5 will trigger "exit"

# Get Selection
    user_selection = gets.chomp

    case user_selection
        when '1'
            puts    "Create a Contact"
            puts "Enter Contact Name"
            new_firstname = gets.chomp
            puts "Enter Contact Phone Number"
            new_phonenumber = gets.chomp
            create_contact(new_firstname, new_phonenumber)
        

        when '2'
            puts    "View All Contacts"
            display_contact
            
        when '3'
            puts "Edit a contact"
            edit_contact
        when '4' 
            puts "Delete Contact"
            del_contact
        when '5'
            puts "There is no knowledge that is not power. Exitting. "
            exit
        else    
            puts "Invalid Selection"
        end
    run_app
    end

#start up the engine, gentlemen!
run_app