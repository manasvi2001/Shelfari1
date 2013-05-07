Shelfari1.Views.Books ||= {}

class Shelfari1.Views.Books.IndexView extends Backbone.View
  template: JST["backbone/templates/books/index"]

  initialize: () ->
    @options.books.bind('reset', @addAll)

  addAll: () =>
    @view = new Shelfari1.Views.Books.NewView(collection:@optionns.books)
    $("#new_book").html(@view.render().el)
    @options.books.each(@addOne)

  addOne: (book) =>
    view = new Shelfari1.Views.Books.BookView({model : book})
    @$("#books-list").append(view.render().el)

  render: =>
    $(@el).html(@template(books: @options.books.toJSON() ))
    @addAll()

return this