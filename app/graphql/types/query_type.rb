module Types
  class QueryType < Types::BaseObject

    field :employees, [Types::Employee], null: false
    def employees
      ::Employee.all.to_a
    end

    field :employee, Types::Employee, null: true do
      argument :employee_id, ID, required: true, as: :id
    end
    def employee(id:)
      ::Employee.find_by_id(id)
    end

    field :user_groups, [Types::UserGroup], null: false
    def user_groups
      ::UserGroup.all.to_a
    end

    field :user_group, Types::UserGroup, null: true do
      argument :user_group_id, ID, required: true, as: :id
    end
    def user_group(id:)
      ::UserGroup.find_by_id(id)
    end

    #region CustomAward Fields
    field :custom_award, Types::CustomAward, null: true do
      argument :custom_award_id, ID, required: true, as: :id
    end
    def custom_award(id:)
      a = ::CustomAward.find_by_id(id)
      a
    end

    field :custom_awards, [Types::CustomAward], null: false
    def custom_awards
      a = ::CustomAward.all
      a
    end
    #endregion

    #region User
    field :user, Types::User, null: false
    def user
      context[:current_user]
    end
    # last of fields
  end
end
