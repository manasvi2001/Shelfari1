class Shelfari1.Models.Book extends Backbone.RelationalModel
  paramRoot: 'book'

  defaults:
    title: null
    author: null
    status: null

   loadFeatures: ->
   	@feature = new Shelfari1.Collections.BooksCollection([],{book_url: @url()});

class Shelfari1.Collections.BooksCollection extends Backbone.Collection
  model: Shelfari1.Models.Book
  url: '/books'