Bandango.SearchMixin = Ember.Mixin.create
  searchTimeout: 300
  cached: {}

  searchResultsEmpty: (->
    not (@get("searchResults.length") > 0) and not @get("searchQueryEmpty") and not @get("isQuerying")
  ).property("searchResults", "searchQueryEmpty", "isQuerying")

  searchQueryEmpty: (->
    Ember.isEmpty @get("currentQuery")
  ).property("currentQuery")

  emptyQuerySearch: ->
    Ember.debug "#emptyQuerySearch. Override this method"

  executeSearch: ->
    Ember.debug "#executeSearch. Override this method"

  getCacheKey: (results) ->
    if results and results.meta and results.meta.query
      results.meta.query.underscore()

  gotResults: (searchResults) ->
    @set "isQuerying", false
    cacheKey = @getCacheKey(searchResults)
    if cacheKey
      @cached[cacheKey] = searchResults
    @set "searchResults", searchResults

  stopScheduledSearch: ->
    if scheduledId = @get("scheduledSearchId")
      clearTimeout scheduledId
      @set "scheduledSearchId", null

  scheduleSearch: ->
    @set "isQuerying", true
    @stopScheduledSearch()
    scheduledSearchId = setTimeout $.proxy(@executeSearch, @), @get("searchTimeout")
    @set "scheduledSearchId", scheduledSearchId

  cachedQueryResults: (term) ->
    @cached[term.underscore()]

  queryChanged: (newQuery) ->
    if Ember.isEmpty(newQuery)
      @stopScheduledSearch()
      @emptyQuerySearch()
    else if !!@cachedQueryResults(newQuery)
      @stopScheduledSearch()
      @gotResults @cachedQueryResults(newQuery)
    else
      @scheduleSearch()
    @set "currentQuery", newQuery
