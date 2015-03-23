module AssetDispatch::ControllerHelpers
  class << self
    def included(base)
      base.send(:before_filter, :set_assetdispatch_headers)
    end
  end

  private def set_assetdispatch_headers
    headers['X-Controller'] = controller_name
    headers['X-Action'] = action_name
  end
end
