$ ->
  texts =
    "wilde" : "Ah, that is in the family, dear, that is in the family. And there was also, I remember, a clergyman who wanted to be a lunatic, or a lunatic who wanted to be a clergyman, I forget which, but I know the Court of Chancery investigated the matter, and decided that he was quite sane. And I saw him afterwards at poor Lord Plumstead's with straws in his hair, or something very odd about him. I can't recall what. I often regret, Lady Caroline, that dear Lady Cecilia never lived to see her son get the title."
    "hipster" : "Farm-to-table esse hoodie scenester, keytar enim polaroid next level keffiyeh wayfarers pork belly placeat reprehenderit ugh quinoa. Selvage photo booth irure thundercats put a bird on it, quinoa delectus mustache seitan. Tattooed exercitation trust fund tumblr plaid cred ullamco tousled culpa. Velit tumblr dolore, chambray kale chips sriracha small batch nesciunt gastropub wayfarers you probably haven't heard of them. Eiusmod american apparel mixtape tousled, selvage 3 wolf moon sustainable etsy 90's consectetur beard semiotics. Irure shoreditch disrupt culpa direct trade, umami vinyl odio duis enim gentrify. Readymade sriracha commodo eu, ut consequat before they sold out ennui.

  Raw denim echo park incididunt, street art vinyl occupy truffaut fap fugiat church-key photo booth ea. Forage semiotics disrupt artisan narwhal. Godard pop-up bespoke blue bottle scenester post-ironic. Actually art party DIY assumenda. Carles selvage pour-over food truck, cupidatat gluten-free wayfarers ad blog. Labore mollit placeat quinoa wes anderson. Vice terry richardson keytar craft beer sed magna velit, aute PBR nostrud hashtag VHS master cleanse ennui."
  
  stopwatch = null

  $('input[name=text]').on 'change', ->
    id = $(@).data 'text'
    $('.target').text texts[id]

  $('button').on 'click', ->
    $(@).attr 'disabled', 'disabled'
    $('textarea')[0].value = ''
    $('textarea').removeAttr('disabled').focus()
  
    startTimer()

  startTimer = ->
    time = 0
    stopwatch = setInterval ->
      if time < 60
        time++
      else
        timeIsUp()
    , 1000
  
  timeIsUp = ->
    clearInterval(stopwatch)
    $('textarea').attr 'disabled', 'disabled'
    $('button').removeAttr 'disabled'
    typed  = $('textarea')[0].value.split ' '
    target = $('.target')[0].innerText.split ' '
    result = []
    wrong  = 0
  
    $.each typed, (i, v) ->
      if v == target[i]
        result[i] = v
      else
        result[i] = "<strong>#{v}</strong>"
        wrong++
  
  
    $('body').append "<div class='score'>#{typed.length} Words Per Minute. #{wrong} Typos.</div>"
    $('body').append "<div class='result'>" + result.join(' ') + "</div>"