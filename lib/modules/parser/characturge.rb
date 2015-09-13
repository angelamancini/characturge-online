module Parser
  class Characturge
    require 'parseconfig'
    require 'json'
    class << self

      def template_meta(template)
        meta = {}

        meta[:title] = template['Template']['Title'].downcase
        meta[:subtitle] = template['Template']['Subtitle'].downcase
        meta[:owner]= 'admin'
        meta[:privacy] = 'public' # 'private'

        meta
      end

      def selection_lists(template)
        list_array = []
        all_lists = template['Template']['SelectionLists'].split(',')
        all_lists.each do |list|
          list_hash = {}
          list_hash[list.downcase.to_sym] = template['SelectionLists'][list].downcase.split(',')
          list_array.push(list_hash)
        end
        list_array
      end

      def true_false(int)
        if int && int == 0
          return false
        elsif int && int == 1
          return true
        else
          return false
        end
      end

      def get_value(values, index)
        if values
          if (values.count - 1) > index
            values[index]
          else
            values.first
          end
        else
          return nil
        end
      end

      def group_traits(group, group_name)
        all_traits = []
        number_of_traits = group['Number'].to_i

        traits = group['Traits'].downcase.split(',') if group['Traits']
        trait_lists = group['TraitLists'].downcase.split(',') if group['TraitLists']
        start_values = group['StartValues'].downcase.split(',') if group['StartValues']
        max_values = group['MaxValues'].downcase.split(',') if group['MaxValues']
        values = group['Values'].downcase.split(',') if group['Values']
        value_lists = group['ValueLists'].downcase.split(',') if group['ValueLists']
        start_values = group['StartValues'].downcase.split(',') if group['StartValues']
        initial_values = group['InitialValues'].downcase.split(',') if group['InitialValues']
        freebie_values = group['FreebieValues'].downcase.split(',') if group['FreebieValues']
        experience_values = group['ExperienceValues'].downcase.split(',') if group['ExperienceValues']
        if traits

          traits.each_with_index do |trait, index|
            t = {}
            trait_name = trait.gsub(':','').downcase.to_sym
            t[trait_name] = {}
            t[trait_name][:value] = get_value(values, index)
            t[trait_name][:trait_list] = get_value(trait_lists, index)
            t[trait_name][:max_value] = get_value(max_values, index).to_i
            t[trait_name][:value_list] = get_value(value_lists, index)
            t[trait_name][:start_value] = get_value(start_values, index)
            t[trait_name][:initial_value] = get_value(initial_values, index)
            t[trait_name][:freebie_value] = get_value(freebie_values, index)
            t[trait_name][:experience_value] = get_value(experience_values, index)
            all_traits.push(t)
          end

          if traits.count != number_of_traits
            extra_traits = number_of_traits - traits.count
            index = 0
            extra_traits.times do |trait|
              index += 1
              t = {}
              trait_name = "#{group_name.downcase.parameterize}_#{index+traits.count}".to_sym
              t[trait_name] = {}
              t[trait_name][:value] = get_value(values, index)
              t[trait_name][:trait_list] = get_value(trait_lists, index)
              t[trait_name][:max_value] = get_value(max_values, index).to_i
              t[trait_name][:value_list] = get_value(value_lists, index)
              t[trait_name][:start_value] = get_value(start_values, index)
              t[trait_name][:initial_value] = get_value(initial_values, index)
              t[trait_name][:freebie_value] = get_value(freebie_values, index)
              t[trait_name][:experience_value] = get_value(experience_values, index)
              all_traits.push(t)
            end
          end

        end

        return all_traits
      end

      def groups(template, segment)
        all_groups = []
        if template[segment]['Groups']
          groups = template[segment]['Groups'].split(',')
          groups.each do |group|
            g = {}

            g[group.downcase.to_sym] = {
                        group_type: template[group]['Type'].downcase,
                        number_of_traits: template[group]['Number'].to_i,
                        freebie_cost: template[group]['FreebieCost'].to_i,
                        show_heading: true_false(template[group]['ShowHeading'].to_i),
                        has_boxes: true_false(template[group]['HasBoxes'].to_i),
                        has_dots: true_false(template[group]['HasDots'].to_i),
                        experience_dot_cost: template[group]['ExperienceDotCost'].to_i,
                        experience_new_cost: template[group]['ExperienceNewCost'].to_i,
                        dots_available: template[group]['DotsAvailable'].to_i,
                        traits: group_traits(template[group], group)
                      }
            all_groups.push(g)
          end
        end
        all_groups
      end

      def segments(template)
        segments = []
        template['Template'].each do |key, value|
          if key.include?('Segment')
            segment = {}

            segment[value.downcase.to_sym] = {
                                                show_heading: true_false(template[value]['ShowHeading']),
                                                has_priorities: true_false(template[value]['HasPriorities']),
                                                dots_available: template[value]['DotsAvailable'].to_i
                                              }
            segment[value.downcase.to_sym][:groups] = groups(template, value)
            segments.push(segment)
          end
        end

        segments
      end

      def parse_gct(file)
        begin
          file = File.open(file.path, 'r+:windows-1252:utf-8')
          template_hash = {}
          template = ParseConfig.new(file)
          template_hash[:meta_data] = template_meta(template)
          template_hash[:selection_lists] = selection_lists(template)
          template_hash[:segments] = segments(template)
          # return template_hash
          return template_hash
        rescue ArgumentError => e
          # binding.pry
          raise ArgumentError, e
        end
      end
    end
  end
end
