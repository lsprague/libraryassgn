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

# The shelf is the tricky part; there's only one library but multiple shelves,
# so shelves have to be able to define subsets of the complete set of library books.

class Shelf < Library
belongs_to :library
has_many :books
attr_accessor :shelfname
@books = Book.all

# create a shelf; a shelf is a hash
    def initialize(shelfname)
    	@shelfname = shelfname
        self.shelved = {}
        fillshelf()
    end
    
    def fillshelf()
         # in the set of book objects, add all matching this shelf name to hash
        for Book in @books
            if placewhere == @shelfname
                shelved.push(Book)
            end
    end
    
    def shelfcontents()
        shelved.each puts "#{title}"
    end
        
end


class Book
belongs_to :library, :shelves
attr_accessor :placewhere
# Create the book and default it to Unshelved: the base state is existing and unsorted.
    def initialize(title)
        @title = title
        @title.placewhere = Unshelved
    end
    
    def enshelf(shelfname)
        @shelfname = shelfname
        @title.placewhere = @shelfname
    end
    
    def unshelf()
        @title.placewhere = Unshelved
    end
end

Unshelved = Shelf.new("Currently Unshelved")

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