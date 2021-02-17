class FunctionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description 
end
