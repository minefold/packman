module SettingsHelper
  def setting(setting)
    send "#{setting['type']}_setting", setting
  end

  def integer_setting(s)
    %Q{
      <label class="control-label" for="#{s['name']}">#{s['label']}</label>
      <div class="controls">
        <input type="text" name="#{s['name']}" placeholder="#{s['default']}">
        <span class="help-block">#{s['hint']}</span>
      </div>
    }
  end

  def boolean_setting(s)
    %Q{
      #{s.inspect}
      <div class="controls">
        <label class="checkbox">
          <input type="checkbox" name="#{s['name']}" #{s['default'] ? 'checked' : ''}">
          #{s['label']}
        </label>
      </div>
    }
  end
end