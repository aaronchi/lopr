module EventHelper
  
  def embed_event(event)
    %(<iframe width="650px" height="530px" frameborder="0" scrolling="no" src="http://attendthisevent.com/SlidesPro.asp?eventid=#{event.event_id}"></iframe>).html_safe
  end
  
  def embed_questions(event)
    %(<iframe width="283px" height="288px" frameborder="0" scrolling="no" src="http://attendthisevent.com/Modern/questionFrame.asp?eventid=#{event.event_id}&EmailQA=0"></iframe>).html_safe
  end
  
  def embed_replay(event)
    %(<iframe width="650px" height="530px" frameborder="0" scrolling="no" src="http://www.attendthisevent.com/SlideReplay.asp?eventID=#{event.event_id}&IAID=#{event.ia_id}"></iframe>).html_safe
  end
  
  def countdown(event, direct = false)
    %(
    <script>
    $(function(){
      $('#counter').countdown({
        startTime: '#{event.timecode}'
      });
    });
    </script>
    #{'<div class="desc">
    Next Event In:
    </div>' if direct }
    <div id="counter"></div>
    <div class="desc">
      <div>Days</div>
      <div>Hours</div>
      <div>Minutes</div>
      <div>Seconds</div>
    </div>
    ).html_safe
  end
  
end