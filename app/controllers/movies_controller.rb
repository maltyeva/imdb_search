class MoviesController < ApplicationController
  def index
    @query = params[:query]
    if @query.present?
      # @movies = Movie.where(title: @query)
      # @movies = Movie.where("title ILIKE ?", "%#{@query}%")
      sql_query = "movies.title @@ :query \
                  OR movies.syllabus @@ :query \
                  OR directors.first_name @@ :query \
                  OR directors.last_name @@ :query"
      # @movies = Movie.joins(:director).where(sql_query, query: "%#{@query}%")
      # @movies = Movie.search_by_title_and_syllabus(@query)
      # @movies = Movie.global_search(@query)
      # @results = PgSearch.multisearch(@query)
      @movies = Movie.search(@query)
    else
      @movies = Movie.all
    end
  end
end
