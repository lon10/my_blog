require 'spec_helper'

describe Comment do
  let (:post) {FactoryGirl.create(:post)}

  it 'should send telegram message after create' do
    allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new('production'))
    allow_any_instance_of(TelegramMessageService).to receive(:send).and_return(true)

    FactoryGirl.create(:comment, post: post)

    expect(TelegramMessageService.instance).to have_received(:send).once
  end
end
