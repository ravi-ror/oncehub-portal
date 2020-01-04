$(document).on 'turbolinks:load', ->
  messages = $('#pointing-poker')
  if $('#pointing-poker').length > 0

    points_html = (user) ->
      html = '<tr class="user-id-'+user.id+'">
          <td id="name">'+user.email+'</td>
          <td id="points">1</td>
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
          pointTd = list.children('tr.user-id-'+data.message.user_id).children('td.points')
          debugger;
          pointTd.html(data.message.point)
          console.log("Point rated", data)
#        messages.append data['message']

      send_message: (message, chat_room_id) ->
        @perform 'send_message', message: message, room_id: chat_room_id


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
      counter = 1
      tr.each (i) ->
        e = $(tr[i])
        console.log "Points ==============+> " + e.children('td.points').html()
        sum += +e.children('td.points').html()
        counter++
        return
      $('#story-point').html(Math.round(sum/counter))