class PrototypesController < ApplicationController
  def index
    @prototypes = Protitype.all
  end

  def new
    @prototype = Prototype.new
  end
end
