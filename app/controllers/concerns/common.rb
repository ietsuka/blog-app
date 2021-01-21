require 'fileutils'

module Common extend ActiveSupport::Concern
  included do
    helper_method :registFile
  end

  def registFile(model, targetFolder, thumbnail)
    if targetFolder == "profile_images"
      FileUtils.rm("public/#{targetFolder}/#{model.id}/#{model.profile_thumbnail}") if model.profile_thumbnail?
      FileUtils.mkdir_p("public/#{targetFolder}/#{model.id}", :mode => 755) if !Dir::exist?("public/#{targetFolder}/#{model.id}")
      File.open("public/#{targetFolder}/#{model.id}/#{thumbnail.original_filename}", 'wb') do |f|
        f.write thumbnail.read
      end
    else targetFolder == "user_images"
      FileUtils.rm("public/#{targetFolder}/#{model.thumbnail}") if model.present?
      File.open("public/#{targetFolder}/#{thumbnail.original_filename}", 'wb') do |f|
        f.write thumbnail.read
      end
    end
    
    @original_filename = thumbnail.original_filename
  end

  def deleteFile(model, target)
    if target == "user"
      FileUtils.rm_rf("public/profile_images/#{model.id}")
      model.contents.find_each do |c|
        FileUtils.rm_rf("public/user_images/#{c.thumbnail}")
      end
    else 
      FileUtils.rm_rf("public/user_images/#{model.thumbnail}")
    end
  end

  def deleteContent(model)
    model.contents.find_each do |c|
      c.destroy
    end
  end

  def deleteComment(model, target)
    if target == "user"
      model.contents.find_each do |c|
        c.comments.find_each do |comment|
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