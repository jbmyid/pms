class Developer < Person
  has_and_belongs_to_many :projects  
  has_many :todos
end
