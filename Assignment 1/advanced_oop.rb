class Class
    def attr_accessor_with_history(attr_name)
        attr_name = attr_name.to_s
        attr_reader attr_name
        attr_history_name = attr_name + "_history"
        attr_reader attr_history_name
        
        class_eval <<-SETTER 
            def #{attr_name}=(value)
                @#{attr_name} = value
                @#{attr_history_name} = @#{attr_history_name} || [nil]
                @#{attr_history_name} << value
            end
        SETTER
    end
end