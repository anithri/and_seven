module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :employees, [Types::Employee], null: false,
          description: "Employees"
    def employees
      ::Employee.all.to_a
    end

    field :employee, Types::Employee, null: true do
      argument :employee_id, ID, required: true, as: :id
    end
    def employee(id:)
      ::Employee.find_by_id(id)
    end

    field :user_groups, [Types::UserGroup], null: false,
          description: "UserGroups"
    def user_groups
      ::UserGroup.all.to_a
    end

    field :user_group, Types::UserGroup, null: true do
      argument :user_group_id, ID, required: true, as: :id
    end
    def user_group(id:)
      ::UserGroup.find_by_id(id)
    end

  end
end
