Shelfari1.Views.Books ||= {}

class Shelfari1.Views.Books.BookView extends Backbone.View
  template: JST["backbone/templates/books/book"]

  events:
    "click .destroy" : "destroy"

  tagName: "li"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
