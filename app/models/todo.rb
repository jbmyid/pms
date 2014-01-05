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

  state_machine :state, initial: :cart  do
    after_transition do |todo|
      todo.state = todo.state
      todo.save
    end

    event :release do
      transition cart: :void, if: lambda { |b| b.can_release? }
    end

    event :do_payment do
      transition cart: :payment, if: lambda {|b| b.can_next?}
    end

    event :payment_done do
      transition payment: :complete, if: lambda {|b| b.can_next?}
    end

    event :cancel do
      transition complete: :cancelled
    end

    after_transition to: :void, do: :release_all_reservations
    after_transition to: :complete, do: :set_complete
    after_transition to: :cancelled, do: :process_cancellation
  end

  private

  def set_defaults
    assigned
  end
end
