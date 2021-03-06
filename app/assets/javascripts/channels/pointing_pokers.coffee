$(document).on 'turbolinks:load', ->

  $('#join-session').click (e) ->
    console.log("Session => ", $('#session-id').val())
    session_id = $('#session-id').val();
    if session_id.trim()
      window.location.href = window.location.href.replace('new', session_id)

  messages = $('#pointing-poker')
  if $('#pointing-poker').length > 0

    points_html = (user) ->
      html = '<tr class="user-id-'+user.id+'">
          <td class="name">'+user.email+'</td>
          <td class="points">Not yet given</td>
          </tr>'
      return html

    App.global_chat = App.cable.subscriptions.create {
      channel: "PointingPokerRoomsChannel"
      room_id: messages.data('chat-room-id')
    },
      connected: ->
        console.log("Connected to pointing poker room chanelle")
# Called when the subscription is ready for use on the server

      disconnected: ->
# Called when the subscription has been terminated by the server

      received: (data) ->
        if data.message.action == 'user_connected'
          console.log("User got connected ", data)
          users = $("#users-list")
          users.append points_html(data.message.user)
        else
          list = $('#users-list')
          tr = $(list.children('tr.user-id-' + data.message.user_id))
          pointTd = $(list.children('tr.user-id-' + data.message.user_id).children('td')[1])
          tr.css('background-color', '#3dc53b');
          setInterval (->
            tr.css('background-color', '#fff');
          ), 600
          pointTd.html(data.message.point)
          console.log("Point rated", data)
#        messages.append data['message']

      send_message: (message, chat_room_id) ->
        @perform 'send_message', message: message, room_id: chat_room_id

    $('#points-buttons button').click (e) ->
      App.global_chat.send_message $(this).data('points'), messages.data('chat-room-id')

    $('#new_point').submit (e) ->
      $this = $(this)
      input = $this.find('#point_point')
      if $.trim(input.val()).length > -1
        App.global_chat.send_message input.val(), messages.data('chat-room-id')
        input.val('')
      e.preventDefault()
      return false

    $('#calculate').click (e) ->
      list = $('#users-list')
      tr = list.children('tr')
      sum = 0
      counter = 0
      tr.each (i) ->
        e = $(tr[i])
        sum += +$(e.children('td')[1]).html()
        counter++
        return
      $('#story-point').html(Math.round(sum/counter))