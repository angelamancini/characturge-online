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
        new_segment = new_template.segments.create(name: segment[:segment], columns: segment[:columns], has_priorities: segment[:has_priorities], show_heading: segment[:show_heading])
        # binding.pry
        segment[:groups].each do |group|
          new_group = new_segment.groups.create(name: group[:group], number: group[:number], show_heading: group[:show_heading], dots_available: group[:dots_available], input_type: group[:type])
          group[:traits].each do |trait|
            new_trait = new_group.traits.create(name: trait[:trait], max_value: trait[:max_value], start_value: trait[:start_value], freebie_cost: trait[:freebie_cost], experiance_dot_cost: trait[:experiance_dot_cost], experiance_new_cost: trait[:experiance_new_cost])
          end
        end
      end
      redirect_to templates_path
    rescue ArgumentError => e
      flash[:error] = "#{e.message}: Please open this file in a text editor (Not Microsoft Word!) and change the encoding to UTF-8"
      redirect_to templates_path
    end
  end
end
