class Person < ApplicationRecord
 def full_name
   fullname = self.first_name + " " + self.last_name
   return fullname
 end
end
