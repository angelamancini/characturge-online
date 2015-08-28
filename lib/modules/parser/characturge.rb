module Parser
  class Characturge
    require 'parseconfig'
    require 'json'
    class << self

      # def segments(segments_hash)
      # end
      #
      # def groups(template)
      # end
      #
      #
      # def get_list(lists, selection_lists, index)
      #   if lists[index] && !lists[index].blank?
      #     new_list = {}
      #     new_list[:list] = lists[index]
      #     new_list[:items] = selection_lists[lists[index]].split(',')
      #     return new_list
      #   end
      # end
      #
      # def get_traits(traits, values, value_lists, max_values, start_values, freebie_cost, experiance_dot_cost, experiance_new_cost, selection_lists, trait_lists)
      #   trait_array = []
      #   traits.each_with_index do |trait, index|
      #     trait_details = {}
      #     trait_details[:trait] = trait
      #     if values
      #       if values.count == 1
      #         trait_details[:value] = values.first
      #       else
      #         trait_details[:value] = values[index]
      #       end
      #     end
      #     if value_lists
      #       trait_details[:value_list] = get_list(value_lists, selection_lists, index)
      #     end
      #     if trait_lists
      #       trait_details[:trait_list] = get_list(trait_lists, selection_lists, index)
      #     end
      #     if max_values
      #       if max_values.count == 1
      #         trait_details[:max_value] = max_values.first
      #       else
      #         trait_details[:max_value] = max_values[index]
      #       end
      #     end
      #     if start_values
      #       if start_values.count == 1
      #         trait_details[:start_value] = start_values.first
      #       else
      #         trait_details[:start_value] = start_values[index]
      #       end
      #     end
      #     if freebie_cost
      #       trait_details[:freebie_cost] = freebie_cost[index]
      #     end
      #     if experiance_dot_cost
      #       trait_details[:experiance_dot_cost] = experiance_dot_cost[index]
      #     end
      #     if experiance_new_cost
      #       trait_details[:experiance_new_cost] = experiance_new_cost[index]
      #     end
      #     trait_array.push(trait_details)
      #   end
      #   return trait_array
      # end

      def parse_gct(file)
        begin
          file = File.open(file.path, 'r+:windows-1252:utf-8')
          template_hash = {}
          template = ParseConfig.new(file)
          # template_hash[:title] = template['Template']['Title'].downcase
          # template_hash[:subtitle] = template['Template']['Subtitle'].downcase
          # template_hash[:stage] = template['Template']['Stage']
          # template_hash[:freeb_total] = template['Template']['FreebTot']
          # template_hash[:exp_total] = template['Template']['ExpTot']
          # segments = []
          # template['Template'].each do |key, value|
          #   if key.include?('Segment')
          #     segment = {}
          #     segment[:segment] = value.downcase
          #     if template[value]['Columns']
          #       segment[:columns] = template[value]['Columns']
          #     else
          #       segment[:columns] = '3'
          #     end
          #     segment[:has_priorities] = template[value]['HasPriorities'].downcase
          #     segment[:show_heading] = template[value]['ShowHeading'].downcase
          #     segment_groups = template[value]['Groups'].split(',')
          #     segment[:groups] = []
          #     segment_groups.each do |sg|
          #       number = template[sg]['Number'].downcase
          #       show_heading = template[sg]['ShowHeading']
          #       dots_available = template[sg]['DotsAvailable']
          #       type = template[sg]['Type'].downcase
          #       # Traits!
          #       traits = template[sg]['Traits'].split(',')
          #       values = template[sg]['Values'].split(',') unless template[sg]['Values'].nil?
          #       value_lists = template[sg]['ValueLists'].split(',') unless template[sg]['ValueLists'].nil?
          #       trait_lists = template[sg]['TraitLists'].split(',') unless template[sg]['TraitLists'].nil?
          #       max_values = template[sg]['MaxValues'].split(',') unless template[sg]['MaxValues'].nil?
          #       start_values = template[sg]['StartValues'].split(',') unless template[sg]['StartValues'].nil?
          #       freebie_cost = template[sg]['FreebieCost'].split(',') unless template[sg]['FreebieCost'].nil?
          #       experiance_dot_cost = template[sg]['ExperienceDotCost'].split(',') unless template[sg]['ExperienceDotCost'].nil?
          #       experiance_new_cost = template[sg]['ExperienceNewCost'].split(',') unless template[sg]['ExperienceNewCost'].nil?
          #       selection_lists = template['SelectionLists']
          #
          #       trait_array = get_traits(traits, values, value_lists, max_values, start_values, freebie_cost, experiance_dot_cost, experiance_new_cost, selection_lists, trait_lists)
          #
          #       # write the group hash
          #       segment[:groups].push({ group: sg, number: number, show_heading: show_heading, dots_available: dots_available, type: type, traits: trait_array })
          #     end
          #     segments.push(segment)
          #   end
          # end
          # template_hash[:segments] = segments
          # # binding.pry
          return template_hash
          # return JSON.pretty_generate(template_hash)
        rescue ArgumentError => e
          # binding.pry
          raise ArgumentError, e
        end
      end
    end
  end
end
