module AssetDispatch::ViewHelpers
  def html_tag(params = {}, *a, &b)
    data_tags = {
      action: action_name,
      controller: controller_name,
    }

    content_tag(:html,
      params.merge(
        'data-action' => action_name,
        'data-controller' => controller_name),
      *a, &b)
  end
end
