class ApplicationPolicy #policeman preventing every action from every user on every instance
  attr_reader :user, :record

  def initialize(user, record)
    @user = user #current_user, which means the person login by default
    @record = record #instance of the model you're working with
  end

  def index? #Restaurant class
    false
  end

  def show? #restaurant instance
    false
  end

  def create? #restaurant instance
    false
  end

  def new? #restaurant instance
    create?
  end

  def update? #restaurant instance
    false
  end

  def edit? #restaurant instance
    update?
  end

  def destroy? #restaurant instance
    false
  end

  class Scope #Restaurant class
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
