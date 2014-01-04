class Person < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable,:trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :name
  # attr_accessible :title, :body

  ["Admin", "Developer"].each do |m|
    define_method m.downcase+"?" do
      m==type
    end
  end
end
