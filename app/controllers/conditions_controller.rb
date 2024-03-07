class ConditionsController < ApplicationController
  # GET /conditions
  def index
    @conditions = Condition.eager_load(:condition_group).all
  end
end
