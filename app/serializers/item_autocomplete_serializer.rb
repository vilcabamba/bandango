class ItemAutocompleteSerializer < ItemSerializer

  attributes :value

  def value
    object.nombre
  end

end
