# == Schema Information
#
# Table name: sani_requests
#
#  id      :integer          not null, primary key
#  last_id :integer          default(0), not null
#

class SaniRequest < ActiveRecord::Base
  include Single
  include Parseable
  
end
