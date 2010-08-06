module ApplicationHelper
  def tab_class(c)
    controller_name == c ? "selected" : ""
  end
end
