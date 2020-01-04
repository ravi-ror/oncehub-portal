$(document).on 'turbolinks:load', ->
  retros = $('#retros')
  if $('#retros').length > 0
    users_list = $('#users-list')

    retro_response_html = (response) ->
      html = '<tr class="user-id-'+response.retro.user_id+'">
          <td class="email">'+response.user.email+'</td>
          <td class="good">'+response.retro.good+'</td>
          <td class="bad">'+response.retro.bad+'</td>
          </tr>'
      return html


    update_response_in_view = (response) ->
      row = users_list.children('tr.user-id-' + response.retro.user_id)
      if row.length
        console.log("Updating current row");
        good = $(row.children('td')[1])
        good.html(response.retro.good)
        bad = $(row.children('td')[2])
        bad.html(response.retro.bad)
      else
        console.log("Adding new row");
        users_list.append retro_response_html(response)

    App.global_chat = App.cable.subscriptions.create {
      channel: "RetroRoomsChannel"
      retro_room_id: retros.data('retro-room-id')
    },
      connected: ->
# Called when the subscription is ready for use on the server

      disconnected: ->
# Called when the subscription has been terminated by the server

      received: (data) ->
        console.log("Received a response", data);
        retros.append data['message']
        update_response_in_view(data.message)

      send_message: (good, bad, retro_room_id) ->
        @perform 'send_message', good: good, bad: bad, retro_room_id: retro_room_id


    $('#new_retro_response').submit (e) ->
      $this = $(this)
      good = $this.find('#retro_response_good')
      bad = $this.find('#retro_response_bad')
      if $.trim(good.val()).length > 1 && $.trim(bad.val()).length > 1
        App.global_chat.send_message good.val(), bad.val(), retros.data('retro-room-id')
        good.val('')
        bad.val('')
      e.preventDefault()
      return false