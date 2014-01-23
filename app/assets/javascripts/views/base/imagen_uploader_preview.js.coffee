Bandango.ImagenUploaderPreview = Ember.View.extend
  attributeBindings: ['src']
  tagName: 'img'

  click: ->
    $("input[type='file']").trigger "click"
