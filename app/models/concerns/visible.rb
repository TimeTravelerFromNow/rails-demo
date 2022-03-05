module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = ['public','private','archived', 'pending']

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  class_methods do
    def public_count
      where(status: 'public').count
    end
  end

  def public?
    status == 'public'
  end

  def private?
    status == 'private'
  end

  def archived?
    status == 'archived'
  end

  def pending?
    status == 'pending'
  end
  
end
