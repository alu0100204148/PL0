$(document).ready(function() {
  $('#PARSE').click(function() {
    try {
      var result = pl0.parse($('#original').val());
      $('#OUTPUT').html(JSON.stringify(result,undefined,2));
    } catch (e) {
      $('#OUTPUT').html('<div class="error"><pre>\n' + String(e) + '\n</pre></div>');
    }
  });

  $("#examples").change(function(ev) {
    var f = ev.target.files[0]; 
    var r = new FileReader();
    r.onload = function(e) { 
      var contents = e.target.result;
      
      input.innerHTML = contents;
    }
    r.readAsText(f);
  });

});
