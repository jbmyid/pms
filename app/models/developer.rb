class Developer < Person
  has_and_belongs_to_many :projects  
end
