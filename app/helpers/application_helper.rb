
module ApplicationHelper
  def per_page
    params[:per_page].present? ? params[:per_page].to_i : 10
  end

  def json_serial(object)
    { current_page: object.current_page, next_page: object.next_page,
      prev_page: object.prev_page, total_pages: object.total_pages,
      per_page: per_page, total_data: object.total_count }
  end
end
