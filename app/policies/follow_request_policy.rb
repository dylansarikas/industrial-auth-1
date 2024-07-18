class FollowRequestPolicy
  attr_reader :user, :follow_request

  def initialize(user, follow_request)
    @user = user
    @follow_request = follow_request
  end

  def index?
    false
  end

  def show?
    true
  end

  def new?
    true
  end

  def edit?
    user == follow_request.sender
  end

  def create?
    true
  end
  
  def update?
    user == follow_request.sender
  end

  def destroy?
    user == follow_request.sender
  end
end
