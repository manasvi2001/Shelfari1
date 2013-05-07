class Shelfari1.Routers.Books extends Backbone.Router
  initialize: (options) ->
    @books = new Shelfari1.Collections.BooksCollection()
    @books.reset options.books

  routes:
    "/new"      : "newBook"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  newBook: ->
    @view = new Shelfari1.Views.Books.NewView(collection: @books)
    $("#books").html(@view.render().el)

  index: ->
    @view = new Shelfari1.Views.Books.IndexView(books: @books)
    $("#books").html(@view.render().el)

  show: (id) ->
    book = @books.get(id)

    @view = new Shelfari1.Views.Books.ShowView(model: book)
    $("#books").html(@view.render().el)

  edit: (id) ->
    book = @books.get(id)

    @view = new Shelfari1.Views.Books.EditView(model: book)
    $("#books").html(@view.render().el)
