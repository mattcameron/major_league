module HomeHelper
  def user_tasks_done?(user)
    [user.name, user.image, user.bio, user.skills].all?(&:present?)
  end

  def event_tasks_done?(event)
    [event.name, event.event_date, event.image].all?(&:present?)
  end

  def all_tasks_done?(user, event)
    user_tasks_done?(user) && event_tasks_done?(event)
  end
end
