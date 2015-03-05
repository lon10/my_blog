require 'spec_helper'

describe Comment do
  let (:post) {FactoryGirl.create(:post)}

  before do
    allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new('production'))
    allow_any_instance_of(TelegramMessageService).to receive(:send).and_return(true)
  end

  it 'should send telegram message after create' do
    FactoryGirl.create(:comment, post: post)
    expect(TelegramMessageService.instance).to have_received(:send).once
  end
end
