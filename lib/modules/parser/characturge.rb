module Parser
  class Characturge
    require 'parseconfig'
    require 'json'
    class << self

      def segments(template)
      end

      def groups(template)
      end

      def traits(template)
      end

      def parse_gct(file)
        begin
          file = File.open(file.path, 'r+:windows-1252:utf-8')
          template_hash = {}
          template = ParseConfig.new(file)
          template_hash[:title] = template['Template']['Title'].downcase
          template_hash[:subtitle] = template['Template']['Subtitle'].downcase
          template_hash[:stage] = template['Template']['Stage']
          template_hash[:freeb_total] = template['Template']['FreebTot']
          template_hash[:exp_total] = template['Template']['ExpTot']
          segments = []
          template['Template'].each do |key, value|
            if key.include?('Segment')
              segment = {}
              segment[:segment] = value.downcase
              if template[value]['Columns']
                segment[:columns] = template[value]['Columns']
              else
                segment[:columns] = '3'
              end
              segment[:has_priorities] = template[value]['HasPriorities'].downcase
              segment[:show_heading] = template[value]['ShowHeading'].downcase
              segment_groups = template[value]['Groups'].split(',')
              segment[:groups] = []
              segment_groups.each do |sg|
                number = template[sg]['Number'].downcase
                show_heading = template[sg]['ShowHeading']
                dots_available = template[sg]['DotsAvailable']
                type = template[sg]['Type'].downcase
                traits = template[sg]['Traits'].split(',')
                values = template[sg]['Values'].split(',') .split(',') unless template[sg]['Values'].nil?
                max_values = template[sg]['MaxValues'].split(',') unless template[sg]['MaxValues'].nil?
                start_values = template[sg]['StartValues'].split(',') unless template[sg]['StartValues'].nil?
                freebie_cost = template[sg]['FreebieCost'].split(',') unless template[sg]['FreebieCost'].nil?
                experiance_dot_cost = template[sg]['ExperienceDotCost'].split(',') unless template[sg]['ExperienceDotCost'].nil?
                experiance_new_cost = template[sg]['ExperienceNewCost'].split(',') unless template[sg]['ExperienceNewCost'].nil?
                trait_array = []
                traits.each_with_index do |trait, index|
                  trait_details = {}
                  trait_details[:trait] = trait
                  if max_values
                    trait_details[:max_value] = max_values[index]
                  end
                  if start_values
                    trait_details[:start_value] = start_values[index]
                  end
                  if freebie_cost
                    trait_details[:freebie_cost] = freebie_cost[index]
                  end
                  if experiance_dot_cost
                    trait_details[:experiance_dot_cost] = experiance_dot_cost[index]
                  end
                  if experiance_new_cost
                    trait_details[:experiance_new_cost] = experiance_new_cost[index]
                  end
                  trait_array.push(trait_details)
                end

                # trait_values
                segment[:groups].push({ group: sg, number: number, show_heading: show_heading, dots_available: dots_available, type: type, traits: trait_array })
              end
              segments.push(segment)
            end
          end
          template_hash[:segments] = segments
          # binding.pry
          return template_hash
        rescue ArgumentError => e
          # binding.pry
          raise ArgumentError, e
        end
      end
    end
  end
end
