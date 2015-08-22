class TemplatesController < ApplicationController
  def index
  end

  def import
    begin
      @template = Template.import(params[:file])
    rescue ArgumentError => e
      flash[:error] = "#{e.message}: Please open this file in a text editor (Not Microsoft Word!) and change the encoding to UTF-8"
      redirect_to templates_path
    end
  end
end
