# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  category_id :integer          not null
#  nombre      :string(255)      not null
#  descripcion :string(255)
#  precio      :float            not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Item < ActiveRecord::Base
  include Validations
  
end
