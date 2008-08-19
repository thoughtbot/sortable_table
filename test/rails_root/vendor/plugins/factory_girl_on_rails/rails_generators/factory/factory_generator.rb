class FactoryGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.directory File.join('test/factories', class_path)
     	m.template 'factory.rb',  File.join('test/factories', class_path, "#{file_name}_factory.rb")
    end
  end

  def factory_line(attribute)
    unless attribute.name == 'name'
      "#{file_name}.#{attribute.name} '#{attribute.default}'"
    else
      "#{file_name}.add_attribute '#{attribute.name}', '#{attribute.default}'"
    end
  end

  protected
    def banner
      "Usage: #{$0} #{spec.name} FactoryName [field:type, field:type]"
    end
end
