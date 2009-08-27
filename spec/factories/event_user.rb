Factory.define(:event_user) do |e|
  e.user_id { Factory(:user) }
  e.event_id { Factory(:event) }
end
