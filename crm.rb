require_relative 'contact'

class CRM

  def initialize(name)
    @name = name
end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] delet a contact'
    puts '[4] Display all the contact'
    puts '[5] search by attribute'
    puts '[6] Exit'
    puts 'input the number:'
  end

  def call_option(ussr_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
  end
end

  def add_new_contact
    print 'Enter First name:'
    first_name = gets.chomp

    print 'Enter last name:'
    last_name = gets.chomp

    print 'Enter email address:'
    email = gets.chomp

    print 'Enter  note:'
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)

  end
#??? i couldn't come up with idea how to do this parts
  def modify_existing_contact
    self.to_contact.modify_existing_contact.to_contact
  end

  def delete_contact

   print 'Enter the ID of the contact to delete: '
   id = gets.chomp.to_i
   c = Contact.find(id)
   display_a_contact(c)
end

  def display_all_contacts
    wipe
    Contact.all.each { |contact|
      puts "ID ##{contact.id}"
      puts "Name: #{contact.full_name}"
      puts "Email: #{contact.email}"
      puts "Note: #{contact.note}"
      puts "\n"
    }
  end
end

  def search_by_attribute
    puts "Enter an attribute you want to search? first name, last name, email, and note. To access the options write \"first_name\", \"last_name\", \"email\", or \"note\"."
    attribute = gets.chomp

    puts "Enter the search value."
    value = gets.chomp

    result = Contact.find_by(attribute, value)
    puts result

  end
end
