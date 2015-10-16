class Book < ActiveRecord::Base

  scope :finished, lambda { where.not(finished_on: nil) }
  scope :recent, lambda { where('finished_on < ?', 2.days.ago) }
  scope :search, ->(keyword){ where(title: keyword) if keyword.present? }



  def finished?
    finished_on.present?
  end
end
