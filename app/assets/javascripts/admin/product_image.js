$(document).on("ready",function(){
  $(document).on("click","#addproduct, #editproduct",function(){
    var mediaDropzone = new Dropzone("#image");
    mediaDropzone.options.acceptedFiles = ".jpeg,.jpg,.png,.gif";
    mediaDropzone.options.maxFiles = 12;
    mediaDropzone.options.autoProcessQueue = false;
    mediaDropzone.options.parallelUploads = 1;

    mediaDropzone.on("addedfile", function(file) {

      var removeButton = Dropzone.createElement('<button class="btn btn-link" >Remove file</button>');
      removeButton.style.cssText = 'position:absolute;left:5px';
      file.previewElement.appendChild(removeButton);
      // Capture the Dropzone instance as closure.
      var _this = this;
      //Listen to the click event
      removeButton.addEventListener("click", function(e) {
        // Make sure the button click doesn't submit the form:
        e.preventDefault();
        e.stopPropagation();
        // Remove the file preview.
        x = confirm("Do you want to delete this file?")
        if (x){
          _this.removeFile(file);
        }else {
          return false;
        }
        // If you want to the delete the file on the server as well,
        // you can do the AJAX request here.
      });
    });

    mediaDropzone.on("maxfilesexceeded", function(file) {
        mediaDropzone.removeAllFiles();
        mediaDropzone.addFile(file);
    });

    mediaDropzone.on("queuecomplete", function() {
      // disable queue auto processing on upload complete
      mediaDropzone.options.autoProcessQueue = false;
      // Redirect page to index
      window.location.reload(true);
      $.ajax({
        url: '/admin/index',
        type: 'GET',
      });
    });
    $(document).on('click', '#editimage', function () {
    // enable auto process queue after uploading started
      mediaDropzone.on("sending", function (file, xhr, formData) {
           formData.append("product_id", $("#id").val());
      });
    });


    $(document).on('click', '#saveimage, #editimage', function () {
    // enable auto process queue after uploading started
      mediaDropzone.options.autoProcessQueue = true;
    // queue processing
      mediaDropzone.processQueue();
    });


    var newQueue = [];
    $(function() {
      $("#image").sortable({
        items: '.dz-preview',
        cursor: 'move',
        opacity: 0.5,
        containment: '#image',
        distance: 20,
        tolerance: 'pointer',
        stop: function () {
          var newQueue = [];
          var queue = mediaDropzone.files;
          $('#image .dz-preview .dz-filename [data-dz-name]').each(function (count, el) {
          var name = el.innerHTML;//el.getAttribute('data-name');
          queue.forEach(function(file) {
             if (file.name === name) {
                  newQueue.push(file);
              }
            });
          });
          mediaDropzone.files = newQueue;

          }
      });
    });

  });
});

// Dropzone.options.mediaDropzone = {
// success: function (response) {
//             eval(response.xhr.response),
//             mediaDropzone.processQueue();
//         }
// };
