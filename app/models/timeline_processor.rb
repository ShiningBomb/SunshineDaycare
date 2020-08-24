class TimelineProcessor
    def process(post)
        post.children.each do |child|
            child.parent.timeline.posts << post
        end
    end
end