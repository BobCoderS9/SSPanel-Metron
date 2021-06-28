$(".navbar a[href^='#'], .smooth").click(function() {
    var target = $($(this).attr('href')).offset().top;
    $('html, body').animate({
        scrollTop: target
    });
    return false;
});

// var author = '<div style="position: fixed;bottom: 0;left: 20px;background-color: #6777ef;box-shadow: 0 4px 8px rgba(0,0,0,.05);border-radius: 3px 3px 0 0;font-size: 12px;padding: 5px 10px;color: #fff;">By <a href="https://twitter.com/mhdnauvalazhar" class="text-light">@mhdnauvalazhar</a> &nbsp;&bull;&nbsp; <a href="https://www.buymeacoffee.com/mhdnauvalazhar" class="text-light">Buy me a Coffee</a></div>';
// $("body").append(author);

$("#my-button").fireModal({
  body: '<p>Your content goes here.</p>',
  created: function(modal) {
      console.log('Modal has been created');
  },
  buttons: [
    {
      text: 'Action',
      class: 'btn btn-primary btn-shadow',
      handler: function(modal) {
        // do something
        alert('Clicked');
      }
    }
  ]
});
