class TemplatesController < ApplicationController
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

  def import
    begin
      @template = Template.import(params[:file])
      new_template = Template.create(title: @template[:title], subtitle: @template[:subtitle])
      @template[:segments].each do |segment|
        new_template.segments.create(name: segment[:segment], columns: segment[:columns], has_priorities: segment[:has_priorities], show_heading: segment[:show_heading])
        segment[:groups].each do |group|
          
        end
      end
      redirect_to templates_path
    rescue ArgumentError => e
      flash[:error] = "#{e.message}: Please open this file in a text editor (Not Microsoft Word!) and change the encoding to UTF-8"
      redirect_to templates_path
    end
  end
end
