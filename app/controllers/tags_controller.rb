class TagsController < ApplicationController
  before_action :require_login, only: [:destroy]

  def show
    @tag = Tag.find(params[:id])
  end

  def index
    @tags = Tag.all
  end

  def destroy
    # Getting an error on the @tag.destroy below.
    # Has to do with foreign key constraint violation.
    # May need to get the 'Tagging' record and delete
    # it first.

    @tag = Tag.find(params[:id])
    @tag.destroy

    flash.notice = "Tag '#{@tag.name}' Deleted!"

    redirect_to articles_path
  end

end
