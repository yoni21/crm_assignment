class Contact
  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts = []
  @@id = 1
  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note

    @id = @@id
    @@id += 1
  end
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
   end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  def self.find(id)
    found_contact = nil

    @@contacts.each do |contact|
      if contact.id == id
        found_contact = contact
      end
    end
    found_contact
  end
  def update(attribute, value)
    if "first_name" == attribute
      @first_name = value
    elsif "last_name" == attribute
      @last_name = value
    elsif "email" == attribute
      @email = value
    elsif "note" == attribute
      @note = value
    else
      puts "please try again"
    end
  end
  def self.find_by(attribute, value)

    found_contact = nil
    @@contacts.each do |contact|
      if "first_name" == attribute || contact.first_name == value
        found_contact = contact
      elsif "last_name" == attribute || contact.last_name == value
        found_contact = contact
      elsif "email" == attribute || contact.email == value
        found_contact = contact
      elsif "note" == attribute || contact.note == value
        found_contact = contact
      else
        puts "You did not put in any attribute or value"
      end
    end
    found_contact
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end

  # Feel free to add other methods here, if you need them.

end
