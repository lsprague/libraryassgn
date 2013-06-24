class Library < ActiveRecord::Base
has_many :books, :shelves
    def initialize()
        @books = Book.all
        @shelves = Shelf.all
    end
    
    def catalog()
        puts "The library contains the following books:"
        @books.each puts "#{title}"
    end
    
    def categories()
        puts "The library sorts books onto the following shelves:"
        @shelves.each puts "#{shelfname}"
    end
end


class Shelf < Library
belongs_to :library
has_many :books
attr_accessor :shelfname

    def initialize(shelfname)
        @shelved = {Book.shelfname.all} #an array of books with that shelf property
    end
    
    def shelfcontents()
        @shelved.each puts "#{title}"
    end
        
end


class Book
belongs_to :library, :shelves
# Create the book and default it to Unshelved: the base state is existing and unsorted.
    def initialize(title)
        @title = title
        @title.Shelf(Unshelved)
    end
    
    def enshelf(shelfname)
        @shelfname = shelfname
        @title.Shelf(@shelfname)
    end
    
    def unshelf()
        @title.Shelf(Unshelved)
    end
end


KforKiller = Book.new("K is for Killer")
IRobot = Book.new("I, Robot")

sf = Shelf.new("Science Fiction")

catalog.Library()

IRobot.enshelf(sf)

sf.shelfcontents()

# To get user input to add to the catalog: ask for input, twice
# First raw input becomes variable bkname; second variable shname
# NewRecord = Book.new(bkname)
# should the shelf option be limited to only existing shelves?
# how much power does the shelving librarian have?

end