module WebIDL
  module ParseTree
    class TypeSuffix < Treetop::Runtime::SyntaxNode

      def apply(type)
        if respond_to?(:array) && array.any?
          type.array = true
        end

        if respond_to?(:null) && null.any?
          type.nullable = true
        end

        if suffix.any?
          suffix.apply(type)
        end
      end

    end # TypeSuffix
  end # ParseTree
end # WebIDL