require_relative './student'
require_relative './teacher'
require_relative './rental'
require_relative './book'

class App
  attr_reader :book, :people, :rental

  def initialize
    @book = []
    @people = []
    @rental = []
  end

  def list_books
    if @book.empty?
      puts 'No books available'
      show_menu
    end
    puts 'List of available books:'
    puts ''
    @book.each_with_index do |item, i|
      puts "#{i} Title: #{item.title}, Author: #{item.author}"
    end
    show_menu
  end

  def list_people
    if @people.empty?
      puts 'No people found today'
      show_menu
    end
    puts 'List of people:'
    puts ''
    @people.each_with_index do |item, i|
      puts "#{i}-- [#{item.class}] Name:#{item.name},  Age: #{item.age}"
    end
    show_menu
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? ..Please input number:  '
    option = gets.chomp.to_i

    case option
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Please select 1 or 2 !'
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @book.push(book)
    puts 'Book successfully created!'
    show_menu
  end

  def create_rental
    puts 'Select a book from the list (Enter number)'
    @book.each_with_index { |item, i| puts "#{i}-- #{item.title}, #{item.author}" }
    index = gets.chomp.to_i
    book = @book[index]
    puts 'Select a person from the list (Enter number)'
    @people.each_with_index { |item, i| puts "#{i}- #{item.name}" }
    person_index = gets.chomp.to_i
    person = @people[person_index]
    print 'Date(yyyy/mm/dd): '
    date = gets.chomp
    rental = Rental.new(date, book, person)
    puts rental
    @rental.push(rental)
    puts 'Rental created successfully'
    show_menu
  end

  def list_rentals
    puts 'Select ID of any person (Please type the number of the ID)'
    @people.each { |item| puts "id: #{item.id}, Person: #{item.name}" }
    print 'Person id: '
    id = gets.chomp.to_i
    @rental.each do |item|
      puts "Date: #{item.date}, Book: #{item.book.title} by #{item.book.author}" if item.person.id.to_i == id
    end
    show_menu
  end

  def show_menu
    puts ''
    print 'Press Enter to go back to menu'
    gets.chomp
    puts ''
  end

  private

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]'
    permission = gets.chomp
    new_student = Student.new(age, permission, name)
    @people.push(new_student)
    puts 'Student created successfully'
    show_menu
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people.push(teacher)
    puts 'Teacher created successfullly'
    show_menu
  end
end
# rubocop:enable Metrics/ClassLength
