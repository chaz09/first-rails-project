class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    user_must_be_logged_in
    scope.where(:id => record.id).exists?
  end

  def create?
    user_must_be_logged_in
    user.present?
  end

  def new?
    user_must_be_logged_in
    user.present?
  end

  def update?
    user_must_be_logged_in
    user.present?
  end

  def edit?
    user_must_be_logged_in
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end


  def user_must_be_logged_in
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
  end
end
