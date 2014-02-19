DS.Model.reopen
  modelName: (->
    constructor = @constructor.toString().split(".")
    constructor[constructor.length - 1]
  ).property()
