class Todo < ActiveRecord::Base
  STATES = {assigned: "assigned", inprogress: "inprogress", done: "done"}
  attr_accessible :description, :name, :developer_id

  validates :name, :description, presence: true
  validate :project_developers_only
  belongs_to :project
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

  state_machine :state, initial: :cart  do
    after_transition do |todo|
      todo.state = todo.state
      todo.save
    end

    event :next do
      transition assigned: :inprogress, inprogress: :done
    end
    
  end

  private

  def project_developers_only
    self.errors[:developer_id] << "can only be developers of Project #{project.name} only" if developer_id && !project.developer_ids.include?(developer_id)
  end

  def set_defaults
    assigned
  end
end
