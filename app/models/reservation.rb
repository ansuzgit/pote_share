class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :post
  default_scope -> { order(created_at: :desc) }
  validates :start_date, presence: true 
  validates :end_date, presence: true
  validates :person_num, presence: true
  validate :date_before_start
  validate :date_before_finish
  validates_acceptance_of :confirming 
  after_validation :check_confirming

  def date_before_start
    return if start_date.blank?
    errors.add(:start_date, "は今日以降のものを選択してください") if start_date < Date.today
  end

  def date_before_finish
    return if end_date.blank? || start_date.blank?
    errors.add(:end_date, "は開始日以降のものを選択してください") if end_date < start_date
  end
  
  def check_confirming
    errors.delete(:confirming)
    self.confirming = errors.empty? ? '1' : ''
  end
  
  
  
  
end
