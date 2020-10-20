module WorkHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_works_path
    elsif action_name == 'edit'
      works_path
    end
  end
end
