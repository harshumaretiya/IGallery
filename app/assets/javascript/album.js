$(document).ready(function () {
  console.log("Hello");
  // when the load more link is clicked
  $('a.load-more').click(function (e) {

      // prevent the default click action
      e.preventDefault();

      // get the last id and save it in a variable 'last-id'
      var last_id = $('.card').last().attr('data-id');
      console.log(last_id)
      // make an ajax call passing along our last user id
      $.ajax({

          // make a get request to the server
          type: "GET",
          // get the url from the href attribute of our link
          url: $(this).attr('href'),
          // send the last id to our rails app
          data: {
              id: last_id
          },
          // the response will be a script
          dataType: "script",

      });

  });
});