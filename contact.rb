class Contact

attr_accessor :first_name, :last_name, :email, :note
attr_reader :id

@@contact = []
@@id = 1
  # This method should initialize the contact's attributes
  def initialize(first_name,last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end
end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = self.new(first_name, last_name, email, note)
    @@contact << new_contact
    @@id += 1
    new_contact
  end

  # This method should return all of the existing contacts
  def self.all
     @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find
    @@contact.each do |contact|
      if contact.id == id
          return contact
      end
    end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
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

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by
    array = []
    @@contacts.each do |contact|
      if contact.send(attribute) == value
        array << contact
      else
        nil
      end
    return array
  end
end
  # This method should delete all of the contacts
  def self.delete_all
     @@contact = []
  end

  def full_name
    "#{first_name} #{last_name}"
end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contact.delete()

  end

  # Feel free to add other methods here, if you need trend
end
