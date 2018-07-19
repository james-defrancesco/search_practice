class PeopleController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @q = Person.ransack(params[:q])
    if params[:q]
      @people = @q.result
    else
      @people = nil
    end
  end

  def sort_column
    if Person.column_names.include?(params[:sort])
      params[:sort]
    else
      Person.column_names.first
    end
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
