class PagesController < ResourceController
  before_filter :require_user

  resource :page
  expose(:editable_attributes) { %w(title body) }
  expose(:pages) { space.pages.order('updated_at DESC') }
  expose(:page)

end
