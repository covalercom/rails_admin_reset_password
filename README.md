# RailsAdminResetPassword

Reset Password custom action for [RailsAdmin](https://github.com/sferik/rails_admin).

See [Custom action](https://github.com/sferik/rails_admin/wiki/Custom-action) on RailsAdmin's wiki.

## Gemfile

```
gem 'rails_admin_reset_password', git: 'git@bitbucket.org:allori/rails_admin_reset_password'
```

## Configuration

Within your `config/initializers/rails_admin.rb`:

```
RailsAdmin.config do |config|
  config.actions do
    # ...

    reset_password

  end
end
```

MIT-LICENSEd.
