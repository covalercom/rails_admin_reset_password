require "rails_admin_reset_password/engine"

module RailsAdminResetPassword
end

require 'rails_admin/config/actions'

module RailsAdmin
  module Config
    module Actions
      class ResetPassword < Edit
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :visible? do
          authorized? &&
            bindings[:object].respond_to?(:password) &&
            bindings[:object].respond_to?(:password=)
        end

        register_instance_option :member? do
          true
        end

        #TODO: Make "bulkable". See https://github.com/sferik/rails_admin/blob/master/lib/rails_admin/config/actions/base.rb

        register_instance_option :link_icon do
          'icon-asterisk'
        end

        # adapted from parent action, Edit
        register_instance_option :controller do
          proc do

            if request.get? # EDIT

              respond_to do |format|
                format.html { render @action.template_name }
                format.js   { render @action.template_name, layout: false }
              end

            elsif request.put? # UPDATE
              #sanitize_params_for!(request.xhr? ? :modal : :update)
              target_params = params[@abstract_model.param_key]
              target_params.slice!(:password)
              target_params.permit! if target_params.respond_to?(:permit!)

              @object.set_attributes(target_params)
              @authorization_adapter && @authorization_adapter.attributes_for(:update, @abstract_model).each do |name, value|
                @object.send("#{name}=", value)
              end
              changes = @object.changes

              if @object.save
                @auditing_adapter && @auditing_adapter.update_object(@object, @abstract_model, _current_user, changes)
                respond_to do |format|
                  format.html {
                    flash['notice'] = "#{@object.name}'s new password is: #{@object.password}"
                    redirect_to_on_success
                  }
                  format.js { render json: {id: @object.id.to_s, label: @model_config.with(object: @object).object_label} }
                end
              else
                handle_save_error :reset_password
              end

            end

          end
        end

      end
    end
  end
end

