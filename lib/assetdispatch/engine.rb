class AssetDispatch::Engine < Rails::Engine
  initializer 'assetdispatch.view_helpers' do
    ActiveSupport.on_load(:action_controller) do
      ActionController::Base.send(:include, AssetDispatch::ControllerHelpers)
    end

    ActiveSupport.on_load(:action_view) do
      ActionView::Base.send(:include, AssetDispatch::ViewHelpers)
    end
  end
end
