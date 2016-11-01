# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [TODO] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

And one small note: I believe that for the final project they want you to be writing your own custom attribute writer as opposed to relying on `accepts_nested_attributes_for`.

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate


Data Model:

Relations:

- Users (has_many :projects, has_may :clients)
- Clients (belongs_to :user, has_many :projects)
  - Projects (belongs_to: client, has_many :proposals)
    - Proposals (belongs_to :project, has_many: sections, has_one :pricing_table)
      - Sections (belongs_to :proposal)
      - Pricing Table (belongs_to :proposal, has_many: item_groups)
        - Item Groups (belongs_to :pricing table, has_many: line_items)
        - Line Items (belongs_to :item_group)

Attributes:

Client:
- Company Name
- Contact Name
- Email

Projects:
- Title
- Status
- ClientID

Proposals:
- Title
- Tagline
- Date
- Status
- ProjectID

Sections:
- Title
- Body
- ProposalID

Pricing Tabel:
- Title
- ProposalID
- Discount
- #total

ItemGroup:
- Title
- PricingTableID
- #subtotal

LineItem:
- Title
- Price
