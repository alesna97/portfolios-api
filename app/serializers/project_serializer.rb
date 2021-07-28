class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :url, :image, :applications, :total_apps, :technologies

  def applications
    object.applications
  end

  def total_apps 
    object.applications.count
  end

  def technologies
    object.technologies
  end
end
