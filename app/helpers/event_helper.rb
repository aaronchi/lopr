module EventHelper
  
  def embed_event(event)
    %(<iframe width="650px" height="530px" frameborder="0" scrolling="no" src="http://attendthisevent.com/SlidesPro.asp?eventid=#{event.id}"></iframe>).html_safe
  end
  
  def embed_questions(event)
    %(<iframe width="283px" height="288px" frameborder="0" scrolling="no" src="http://attendthisevent.com/Modern/questionFrame.asp?eventid=#{event.id}&EmailQA=0"></iframe>).html_safe
  end
  
end