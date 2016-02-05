class TagsController < ApplicationController

  def index
    Tag.where("name ILIKE (?)", params[:term])
  end

end
