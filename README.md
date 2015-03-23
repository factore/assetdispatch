assetdispatch
=============

Dead simple asset dispatching that works with [turbolinks][turbolinks].
Specify code or styles that only apply to certain controllers and actions.

installation
============

1. Put `gem 'assetdispatch', git: 'http://git.devlinzed.com/assetdispatch'` in
   your Gemfile.
2. Put `//= require assetdispatch` in your JavaScript manifest file.
3. Ensure your `html` tag has `data-action` and `data-controller` attributes.
   You can replace `%html{ lang: I18n.locale }` with `= html_tag(lang:
   I18n.locale) do` to do this, or add them yourself.

javascript api
==============

```javascript
route('application#initialize', function() {
  // called when the page loads
});

route('posts#show', function() {
  // called when you're on pages#show
});

route('admin#initialize', 'application#edit', function(controller, action) {
  // called when you're on any AdminController or edit page
});
```

css api
=======

```css
html[data-controller=posts][data-action=show] {
  /* only affects posts#show */
}
```

[fork]: http://git.devlinzed.com/turbolinks
[turbolinks]: https://github.com/rails/turbolinks
