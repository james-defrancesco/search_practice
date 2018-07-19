class PeopleController < ApplicationController

    helper_method :sort_column, :sort_direction
      def index
        @search = Person.ransack(params[:q])
        @search_results = @search.result
        @people = Person.order(sort_column + ' ' + sort_direction)
      end

      def sort_column
        if Person.column_names.include?(params[:sort])
          return params[:sort]
        else
          return Person.column_names.first
        end
      end

      def sort_direction
        %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
      end
end
