class Todo < ActiveRecord::Base
  STATES = {assigned: "assigned", inprogress: "inprogress", done: "done"}
  attr_accessible :description, :name, :developer_id

  validates :name, :description, presence: true

  before_create :set_defaults

  STATES.each do |i,v|
    define_method "#{i}?" do
      self.state == v
    end
    define_method "#{i}" do
      self.state = v
    end
    define_method "#{i}!" do
      update_column(:state, v)
    end
  end

  private

  def set_defaults
    assigned
  end
end
