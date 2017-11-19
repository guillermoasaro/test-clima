class Area < ApplicationRecord
  belongs_to :parent, class_name: 'Area', optional: true
  has_many :children, class_name: 'Area', foreign_key: 'parent_id'
  after_save :update_parent_grade
  @@debug = true
  
  def update_parent_grade
    print "saving #{self}\n" if @@debug
    if parent and grade
      print "updating parent of #{self}\n" if @@debug
      parent.update_grade
    end
  end

  def update_grade
    update grade: children_average_grades.round(2)
  end

  def children_average_grades
    sum = children_with_grades.sum{|c| c.grade}
    print "sum= #{children_with_grades.map{|c| c.grade}} = #{sum.round(2)}\n" if @@debug
    print "count= #{children_with_grades.count}\n" if @@debug
    print "grade= #{(sum / children_with_grades.count).round(2)}\n\n" if @@debug
    sum / children_with_grades.count
  end

  def children_with_grades
    children.select {|c| c.grade}
  end

  def to_s
    "#{id} - #{name}: #{grade}"
  end

end
