module QuestionsHelper

    def tag_links(tags)
        tags.split(",").map{|tag| link_to tag.id, tag_path(tag.id) }.join(", ") 
    end

    def tag_cloud(tags, classes)
        max = tags.sort_by(&:count).last
        tags.each do |tag|
          index = tag.count.to_f / max.count * (classes.size-1)
          yield(tag, classes[index.round])
        end
      end
end
