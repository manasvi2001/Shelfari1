Shelfari1.Views.Books ||= {}

class Shelfari1.Views.Books.ShowView extends Backbone.View
  template: JST["backbone/templates/books/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
