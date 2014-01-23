Bandango.ImagenUploaderView = Ember.TextField.extend
  type: "file"

  change: (e) ->
    input = e.target
    if input.files && input.files[0]
      that = @
      reader = new FileReader()
      reader.onload = (e) ->
        data = e.target.result
        that.set('parentView.content', data)
      reader.readAsDataURL(input.files[0])
