class Library

    def initialize()
        @contents = contents
    end
    
    def catalog()
        puts "The library contains the following books:"
        @titles.each do |title|
            puts "#{name}"
        
    end
end


class Shelf

    def initialize(shelfname)
        #hash = shelfname
    end
    
    def shelfcont()
    
    def addbook()
        # append @book 
    end
    
    def removebook()
        #syntax to remove @book from hash
        # unless it already wasn't there; then
        # puts "Hmm, that book wasn't on this shelf."
    end
end


class Book

    def initialize(title, shelf)
        @title = title
        @shelf = shelf
    end
    
    def enshelf()
        Shelf.new(@shelf)
        @title.addbook()
    end
end


KforKiller = Book.new("K is for Killer", Mystery)


# To get user input to add to the catalog: ask for input, twice
# First raw input becomes variable bkname; second variable shname
# NewRecord = Book.new(bkname, shname)