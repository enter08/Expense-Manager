$(function() { 
  $('#expense_location_id').select2({
    placeholder: "Search for a location",
    minimumInputLength: 1,
    ajax: {
      url: "/locations.json",
      dataType: 'json',
      data: function(term, page) { 
          return { 
            q: term, 
            page: page
          } 
      },
      results: function(data, page) { 
        return { 
          results: data
        } 
      }
    }
  });

});