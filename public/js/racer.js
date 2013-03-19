$(document).ready(function() {
    var player1_counter = 1;
    var player2_counter = 1;
    var track_length = 40;

    function get_winner(data) {
      $.ajax ({
        type: 'POST',
        data: { sql: data },
        url: '/results'
      })
      .done(function() {
        // window.location = '/results';
      });
    }

  $(document).on('keyup', function(event) {

    var code = event.keyCode;

    function update_player_position(player) {
      var active = $("#" + player + "_strip td.active");
      active.removeClass('active').next().addClass('active');
    }

    if(code == 81) {
      update_player_position('player1');
      player1_counter += 1;
      if ($('#player1_strip td.active').hasClass('winner')) {
        $(document).off('keyup');
        $('.p1_winner').css('display', 'inline');
        var winner = $('.p1_winner').text();
        get_winner(winner);
        $('.results_button').css('display', 'block');
      }
    }

    if(code == 80) {
      update_player_position('player2');
      player2_counter += 1;
      if ($('#player2_strip td.active').hasClass('winner')) {
        $(document).off('keyup');
        $('.p2_winner').css('display', 'inline');
        var winner = $('.p2_winner').text();
        get_winner(winner);
        $('.results_button').css('display', 'block');
      }
    }

  });
});
