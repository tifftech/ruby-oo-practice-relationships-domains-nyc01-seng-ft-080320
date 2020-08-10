# create files for your ruby classes in this directory

class Bakery

    attr_accessor :name
    @@all = []

    def initialize(name) 
        @name = name
        @@all << self
    end

    def self.all 
        @@all
    end

    def desserts 
        Dessert.all.select{ |dessert| dessert.bakery == self }
    end

    def ingredients 
        self.desserts.map { |dessert| dessert.ingredients }
    end

end

class Dessert

    attr_accessor :name, :bakery
    @@all = []

    def initialize(name, bakery) 
        @name = name
        @bakery = bakery
        @@all << self
    end

    def self.all 
        @@all
    end

    def ingredients 
        Ingredient.all.select{ |ingredient| ingredient.dessert == self }
    end

end

class Ingredient

    attr_accessor :name, :dessert
    @@all = []

    def initialize(name, dessert) 
        @name = name 
        @dessert = dessert
        @@all << self
    end

    def self.all 
        @@all 
    end

    def bakery
        self.dessert.bakery
    end

end