module AssetDispatch
  autoload :ControllerHelpers, 'assetdispatch/controller_helpers'
  autoload :VERSION, 'assetdispatch/version'
  autoload :ViewHelpers, 'assetdispatch/view_helpers'

  require 'assetdispatch/engine' if defined?(Rails)
end
