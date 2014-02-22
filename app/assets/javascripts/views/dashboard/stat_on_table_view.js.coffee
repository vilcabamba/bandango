Bandango.StatOnTableView = Ember.View.extend
  templateName: "dashboard/stat_on_table"
  tagName: "tr"
  classNames: "row align_center has_margin".w()
  classNameBindings: "model.name"
