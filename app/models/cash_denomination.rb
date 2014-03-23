# == Schema Information
#
# Table name: cash_denominations
#
#  id    :integer          not null, primary key
#  price :decimal(10, 2)   not null
#  kind  :string(255)      not null
#

class CashDenomination < ActiveRecord::Base
  include Cacheable

# validations
  validates :price, presence: true
  validates :kind, presence: true
  validate :validate_uniqueness

# methods
  def validate_uniqueness
    errors.add(:base, "Ya existe") if self.class.where.not(id: id).exists?(price: price, kind: kind)
  end
end
