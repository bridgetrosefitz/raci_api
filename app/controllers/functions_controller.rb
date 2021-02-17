class FunctionsController < ApplicationController

  def index
    functions = Function.all
    render json: FunctionSerializer.new(functions)
  end

end
