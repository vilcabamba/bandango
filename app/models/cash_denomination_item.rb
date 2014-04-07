# == Schema Information
#
# Table name: cash_denomination_items
#
#  id                   :integer          not null, primary key
#  cash_denomination_id :integer          not null
#  cierre_caja_id       :integer          not null
#  cantidad             :integer          default(0), not null
#  created_at           :datetime
#

class CashDenominationItem < ActiveRecord::Base
# relationships
  belongs_to :cierre_caja
  belongs_to :cash_denomination

# methods
  def total
    cantidad.to_i * cash_denomination.price
  end

  def cash_denomination
    @cash_denomination ||= CashDenomination.cached_find(cash_denomination_id)
  end
end
