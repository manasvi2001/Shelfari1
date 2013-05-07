Shelfari1.Views.Books ||= {}

class Shelfari1.Views.Books.NewView extends Backbone.View
  template: JST["backbone/templates/books/new"]

  events:
    "submit #new-book": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (book) =>
        view = new Shelfari1.Views.Books.BookView({model : book})
        $("#books-list").prepend(view.render().el)

      error: (book, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
