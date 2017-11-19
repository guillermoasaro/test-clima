class AreaSerializer < ActiveModel::Serializer
  attributes :id , :name, :grade, :children
  #has_many :children

  def children
    object.children.map{|child| AreaSerializer.new(child).serializable_hash}
  end

end
