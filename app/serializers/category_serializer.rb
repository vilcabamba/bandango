class CategorySerializer < ActiveModel::Serializer

  attributes :id,
             :nombre,
             :items_count

  def items_count
    object.items.count
  end

end
