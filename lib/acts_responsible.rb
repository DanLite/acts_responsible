require 'acts_responsible/core'

# make dependencies available to parent project
require 'rabl'

module ActsResponsible
  def responsible?
    self.included_modules.include?(ActsResponsible::Core)
  end

  def acts_responsible(prefix)
    class_attribute :responsible_config

    self.responsible_config = { prefix: prefix }

    return if responsible?

    include ActsResponsible::Core

    append_view_path(File.dirname(__FILE__) + '/acts_responsible/templates')
  end
end