class Todo < ApplicationRecord
  belongs_to :user

  enum :status, [ :CREATED, :STARTED, :COMPLETED, :CANCELLED ]
  enum :priority, [ :LOW, :MEDIUM, :HIGH ]

  validates :title, {
    presence: true, 
    length: { minimum: 5, maximum: 20 }
  }
  validates :description, {
    presence: true,
    length: { minimum: 20 }
  }
  # validates :status, {
  #   numericality: { in: 0..3}
  # }

  # validates :priority, {
  #   numericality: { in: 0..2}
  # }
end
