require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Mutlipart_parameter #fail in association_proxy#new" do
  before(:each) do
    @user = Factory(:user)
    @multipart_date_parameter =  { "starts_on(1i)"=>"2009",
                                   "starts_on(2i)"=>"8",
                                   "starts_on(3i)"=>"27",
                                   "starts_on(4i)"=>"15",
                                   "starts_on(5i)"=>"46"}

    @event = Event.create(@multipart_date_parameter)
  end

  it "should have a valid user" do
    @user.should be_valid
  end

  it "should have a valid event" do
    @event.should be_valid
  end

  describe "event_user creation" do
    context "standalone" do
      before(:each) do
        @event_user_attributes = Factory.attributes_for(:event_user, :user_id => @user.id, :event_id => @event.id)
        @event_user = EventUser.create( @event_user_attributes )
      end
      it "creates a valid event_user " do
        @event_user.should be_valid
      end
    end
    
    context "via association proxy without a multipart_parameter" do
      before(:each) do
        @event_attributes_without_multipart_parameter = Factory.attributes_for(:event)
        @event_without_multipart_parameter = @user.events.create(@event_attributes_without_multipart_parameter)
      end

      it "creates the association, and @user.event should contain the @event" do
       @user.events.should include(@event_without_multipart_parameter)
      end
    end
    context "via association proxy with a multipart_parameter" do
      before(:each) do
        @event_with_multipart_parameter = @user.events.create(@multipart_date_parameter)
      end
      it "creates the association, and @user.event should contain the @event" do
        @user.events.should include(@event_with_multipart_parameter)
      end
    end
  end
end

