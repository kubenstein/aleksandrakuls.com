$(document).ready(function() {
  $el = $('#js-random-image-gallery');

  if($el.length > 0) {
    images_data = $.map(random_gallery_paths, function(page_path, file_path) { return {page_path: page_path, file_path: file_path} })
                  .sort(function() { return .5 - Math.random() })
                  .slice(0, 6);
    $.each( images_data, function(_, image_data) {
      $el.append(
        '<div class="item"><div class="image-centered-container">' + 
        '<a href="'+ image_data.page_path +'">' +
        '<img src="'+ image_data.file_path +'" />' +
        '</a></div></div>'
      );
    });
  }

});