require 'application_system_test_case'

class QuestionsTest < ApplicationSystemTestCase
  test 'visiting /ask renders the form' do
    visit ask_url
    assert_selector 'p', text: 'Ask your coach anything'
  end

  test 'saying Hello yields a grumpy response from the coach' do
    visit ask_url
    fill_in 'question', with: 'Hello'
    click_on 'Ask'

    assert_text "I don't care, get dressed and go to work!"
  end

  test 'saying nothing yields a response from the coach who wants something' do
    visit ask_url
    fill_in 'question', with: '   '
    click_on 'Ask'

    assert_text 'Speak to me!'
  end

  test 'saying "I am going to work right now!" yields a good response from the coach' do
    visit ask_url
    fill_in 'question', with: 'I am going to work right now!'
    click_on 'Ask'

    assert_text 'Great!'
  end

  test 'asking a question yields a mean response from the coach' do
    visit ask_url
    fill_in 'question', with: 'Hello?'
    click_on 'Ask'

    assert_text 'Silly question, get dressed and go to work!'
  end

  test 'shouting HELLO yields a middle-grumpy response from the coach' do
    visit ask_url
    fill_in 'question', with: 'HELLO'
    click_on 'Ask'

    assert_text "I can feel your motivation! I don't care, get dressed and go to work!"
  end

  test 'shouting "I AM GOING TO WORK RIGHT NOW!" yields a very good response from the coach' do
    visit ask_url
    fill_in 'question', with: 'I AM GOING TO WORK RIGHT NOW!'
    click_on 'Ask'

    assert_text 'I can feel your motivation! Great!'
  end

  test 'asking a question while shouting yields a middle-mean response from the coach' do
    visit ask_url
    fill_in 'question', with: 'HELLO?'
    click_on 'Ask'

    assert_text 'I can feel your motivation! Silly question, get dressed and go to work!'
  end
end
