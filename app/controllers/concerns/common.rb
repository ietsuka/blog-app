module Common extend ActiveSupport::Concern
  def deletePost(model)
    model.posts.find_each do |c|
      c.destroy
    end
  end

  def deleteComment(model, target)
    if target == "user"
      model.posts.find_each do |c|
        c.comments.find_each do |c|
          c.destroy
        end
      end
    else
      model.comments.find_each do |c|
        c.destroy
      end
    end
  end
end