require 'sqlite3'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3'
  database: 'demo.sqlite3' #this tells you the path to the database you are interacting with
)

class Actor < ActiveRecord::Base
  #you may also define your own ruby methods within this class to interact with the ruby objects you pull out of the db.

  because you are inheriting from ActiveRecord there are certain ruby methods you may use that automatically generate sql commands
  actor.methods - lets you see all the methods
  actor.find(4) - lets you find a certain actor based on the id
  actor.count - does a count just like the SQL COUNT
  actor.where ("name LIKE '%T%' ").count - SELECT * COUNT FROM actors WHERE name LIKE "%T%"
  nicole = Actor.new - this is letting you create a new instance in the table
    actor.name = 'Nicole'
    nicole.salary = 50
    nicole - call it and see what she is in the db.
  nicole.save - #lets you save the new record to the db. # this lets you save nicole to the database
   #you may also add a new actor by sending the values in a hash style
  # hardy = Actor.new (name: "Tom Hardy", salary: 400)


 nicole = actor.last or actor.first #this lets you get the actor back out of the db and store it as a ruby object you may work on.
  nicole.changes - lets you see if anything changed on the actor from what was storedd in the database.
 tom = Actor.where(name LIKE '%Tom% ')#returns an array of all the actors in the database that include TOM in the name.
      #then you may work with it like an array, so you may extract the tom you want to work with by tom[1] - would select the second tom in the table
  tom = Actor.where(name LIKE '%Tom% ').first - will return the first one you find (its a ruby method that uses sql to get the first tom.)
      # you may also do where clauses with a hash
  Actor.where(name: 'tom cruise')
# or using the method find_by
  Actor.find_by(name: "tom cruise")
Actor.average(:salary)
Actor.sum(:salary)
Actor.where("name LIKE '%T'").sum(:salary) #this finds the sum of the salarys paid to all actors with the first name T

sally = Actor.create(name: "Sally Fields", salary: 30000) #this will return an id because by using create it automatically saves it to the db for you.

sally.update(salary: 420000) #this will automatically save to the db.
end


class Director < ActiveRecord::Base #this will let you talk to a new table in your database
  #activerecord will create methods based on all the fields in this table

  has_many :movies #this allows you to call a director with a .movie methods, this looks like select * from Movies where director_id = 1
  # it will return an array with all the movies

end

class Movie < ActiveRecord::Base
  belongs_to :director # Select * from
  # this tells movies that it can look at the director table
  #belongs_to has been branded with the ID it belongs to.  To, this method is saying, go tot he directors table and call the director_id when I say
    #movie.director.
  has_many :appearances #this only gets you to the appearances table, it let's you call .appearance on the movie class

  has_many :actors, through: :apearances # this acts like an INNER JOIN; this gets you to the actors table THRU the appearance table.
                                          # so it let's you get movie.actors
end

class Appearances < ActiveRecord::Base
  belongs_to :actor #this will look at actor_id
  belongs_to :movie #this will look at movie_id
end

appear = Appearance.first #this will add the actor_id and movie_id into a variable that you may interact with
appear.movie #so then, when you call this, it will give you the movie information from the movie_id on the movie table
appear.actor #this will give you the actor info for the id on the actor table.

appearance.group(:actor_id)
appearance.joins(:actor).group("actors.id")
itme.select().order().limit()
