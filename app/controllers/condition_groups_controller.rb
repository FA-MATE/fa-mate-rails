class ConditionGroupsController < ApplicationController
  # GET /condition_groups
  def index
    @condition_groups = ConditionGroup.all
  end
end
