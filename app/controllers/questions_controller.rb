class QuestionsController < ApplicationController
  def ask; end

  def answer
    @answer = if params[:question].strip.empty?
                'Speak to me!'
              elsif params[:question] == params[:question].upcase
                "I can feel your motivation! #{answer_enhanced}"
              else
                answer_enhanced
              end
  end

  private

  def answer_enhanced
    @answer = if params[:question].include?('?')
                'Silly question, get dressed and go to work!'
              elsif params[:question].upcase == 'I AM GOING TO WORK RIGHT NOW!'
                'Great!'
              else
                "I don't care, get dressed and go to work!"
              end
  end
end
