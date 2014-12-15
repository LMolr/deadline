require 'deadline'

describe Deadline::Deadline do

  it 'is initialized correctly' do
    deadline = Deadline::Deadline.new
    expect(deadline.duration).to eq(Deadline::Deadline.default_duration)
    expect(deadline.start_time).to be_nil
    expect(deadline.started?).to be false
    expect(deadline.time_left).to be_nil
    expect(deadline.expired?).to be false
  end

  it 'allows changing the defaults' do
    default_duration = 1337
    Deadline::Deadline.default_duration = default_duration
    deadline = Deadline::Deadline.new
    expect(deadline.duration).to eq(default_duration)
  end

  it 'can be started' do
    deadline = Deadline::Deadline.new
    deadline.start
    expect(deadline.start_time).to_not be_nil
    expect(deadline.started?).to be true
    expect(deadline.time_left).to_not be_nil
  end

  it "fails to start if it's already started" do
    deadline = Deadline::Deadline.new
    deadline.start
    expect { deadline.start }.to raise_error
  end

  it "expires after `duration` seconds have elapsed" do
    duration = 0.79
    deadline = Deadline::Deadline.new(duration)
    deadline.start
    sleep(duration)
    expect(deadline.time_left).to be <= 0
    expect(deadline.expired?).to be true
  end

end
