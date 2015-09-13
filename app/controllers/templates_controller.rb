class TemplatesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:import, :new]
  def index
    @templates = Template.all
  end

  def show
    @template = Template.find(params[:id])
  end

  def destroy
    template = Template.find(params[:id])
    template.destroy
    flash.now[:notice] = "#{template.title} deleted."
    redirect_to templates_path
  end

  def new
    @template = Template.new
    @selection_lists = @template.selection_lists.build
    @list_items = @selection_lists.list_items.build
    if params[:file]
      @import = Template.import(params[:file])
    end

  end

  def import

    # begin
    #   @template = Template.import(params[:file])
    #   render @template
    # rescue ArgumentError => e
    #   flash[:error] = "#{e.message}: Please open this file in a text editor (Not Microsoft Word!) and change the encoding to UTF-8"
    #   redirect_to new_template_path
    # end
  end
end
