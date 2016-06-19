module ApplicationHelper
  def bootstrap_flash_class(flash_type)
  { success: 'alert-success',
    danger:   'alert-danger',
    alert:   'alert-warning',
    notice:  'alert-info',
    error:  'alert-danger' }[flash_type.to_sym] || flash_type.to_s
  end
end
