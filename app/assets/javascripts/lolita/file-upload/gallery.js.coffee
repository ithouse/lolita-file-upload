class window.LolitaFileUploadGallery
  @_instance: null
  _initialized: false
  _imageQueue: []

  @buttonTitle = ""
  @buttonImage = ""
  @availableFileIcons = {}

  GALLERY_SELECTOR = "#fixed-gallery"
  SLIDER_SELECTOR = "#fixed-gallery .slider"
  CLOSE_BUTTON_SELECTOR = "#fixed-gallery .close"
  TAPE_SELECTOR = "#fixed-gallery .slider ul"
  IMAGE_SELECTOR = "#fixed-gallery .slider li .image img"
  FILE_ICON_SELECTOR = "#fixed-gallery .slider li .file img"

  @get: ->
    if not @_instance?
      @_instance = new @
    @_instance

  init: ->
    @_observeImageDropping()
    @_createSlider()
    @_addImagesToDOM()
    @_observeCloseButton()
    if tinyMCE.majorVersion == '3'
      @_addButtonToTinyMCEversion3()
    @._initialized = true

  _observeImageDropping: ->
    if tinyMCE.majorVersion == '3'
      tinyMCE.onAddEditor.add (manager, editor) =>
        @_observeDropOnTinyMCEEditor(editor)
    else
      tinyMCE.on "AddEditor", (e) =>
        @_observeDropOnTinyMCEEditor(e.editor)


  toggle: ->
    @_gallery().toggle()
    @_slider().elastislide("refresh")

  add: (filePath, originalFilePath) ->
    if @_isImagePath(filePath)
      $fileContainer = @_imageContainer(filePath, originalFilePath)
    else
      $fileContainer = @_fileContainer(filePath, originalFilePath)
    if @._initialized
      @_addToDOM($fileContainer)
    else
      @_addToQueue($fileContainer)

  _createSlider: ->
    @_slider().elastislide({
      imageW: 100
      border: 2
      margin: 5
    })

  _image_and_icon: ->
    $(IMAGE_SELECTOR + ',' + FILE_ICON_SELECTOR)

  _makeImagesDraggable: ->
    @_image_and_icon().each(->
      if $(this).is('.ui-draggable')
        $(this).draggable("destroy")
    )
    @_image_and_icon().draggable({
      appendTo: "body"
      zIndex: 20000
      helper: "clone"
      cursor: "move"
    })

  _addImagesToDOM: ->
    while image = @._imageQueue.shift()
      @_addToDOM(image)

  _observeCloseButton: ->
    $(CLOSE_BUTTON_SELECTOR).mouseenter(->
      $(this).addClass("ui-state-hover")
    ).mouseleave(->
      $(this).removeClass("ui-state-hover")
    ).click(=>
      @_gallery().hide()
    )

  _addButtonToTinyMCEversion3: ->
    TinyMCEConfigManager.get().config.addAfter("buttons", "gallery", "image")
    TinyMCEConfigManager.get().config.addFunction("setup", (editor) ->
      editor.addButton("gallery", {
        title: window.LolitaFileUploadGallery.buttonTitle
        image: window.LolitaFileUploadGallery.buttonImage
        onclick: ->
          window.LolitaFileUploadGallery.get().toggle()
      })
    )

  _addButtonToTinyMCE: (editor) ->
    editor.addButton "gallery",
      title: LolitaFileUploadGallery.buttonTitle
      image: LolitaFileUploadGallery.buttonImage
      onclick: ->
        LolitaFileUploadGallery.get().toggle()

  _gallery: ->
    $(GALLERY_SELECTOR)

  _slider: ->
    $(SLIDER_SELECTOR)

  _isImagePath: (filePath) ->
    filePath.match(/\.(jpg|jpeg|gif|png|ico)$/i)

  _getFileExtension: (filePath) ->
    filePath.substr(filePath.lastIndexOf('.') + 1)

  _getFileIcon: (filePath) ->
    extension = @_getFileExtension(filePath)
    if LolitaFileUploadGallery.availableFileIcons[extension]
      LolitaFileUploadGallery.availableFileIcons[extension]
    else
      LolitaFileUploadGallery.availableFileIcons['unknown']

  _getFileBasename: (filePath) ->
    filePath.replace(/\\/g, "/").replace( /.*\//, '' )

  _tape: ->
    $(TAPE_SELECTOR)

  _imageContainer: (imagePath, originalImagePath) ->
    $('<li>').html(
      $('<a>').attr('href','#').addClass('image').html(
        @_imageTag(imagePath, originalImagePath)
      )
    )

  _imageTag: (imagePath, originalImagePath) ->
    $('<img>').attr({src: imagePath, alt: imagePath}).attr('data-original-url', originalImagePath)

  _fileContainer: (filePath, originalFilePath) ->
    $('<li>').html(
      $('<a>').attr('href', '#').addClass('file').html(
        $('<img>').attr({src: @_getFileIcon(originalFilePath), title: @_getFileBasename(originalFilePath)})
        .attr('data-original-url', originalFilePath)
      )
    )

  _addToDOM: ($imageContainer) ->
    @_tape().append($imageContainer)
    @_slider().elastislide("add", $imageContainer)
    @_makeImagesDraggable()

  _addToQueue: ($imageContainer) ->
    @._imageQueue.push($imageContainer)

  _observeDropOnTinyMCEEditor: (newEditor) ->
    self = this
    if tinyMCE.majorVersion == '3'
      newEditor.onInit.add (editor) ->
        $(editor.contentDocument).ready ->
          self._editorContainer(editor).droppable({
            drop: (event, ui) ->
              editor.selection.setContent(self._insertableTag(ui.draggable))
          })
    else
      newEditor.on "LoadContent", (e) ->
        $(e.target.getContainer()).droppable({
          drop: (event, ui) ->
            e.target.selection.setContent(self._insertableTag(ui.draggable))
        })

  _editorContainer: (editor) ->
    $("#" + editor.editorContainer).find(".mceIframeContainer")

  _insertableTag: (draggable) ->
    filePath = draggable.attr("data-original-url")
    if @_isImagePath(filePath)
      @_insertableImageTag(filePath)
    else
      @_insertableFileTag(filePath)

  _insertableImageTag: (imagePath) ->
    "<img src='" + imagePath + "' alt='" + imagePath + "' />"

  _insertableFileTag:  (filePath) ->
    "<a class='file-icon' href='" + filePath + "'><img src='" + @_getFileIcon(filePath) + "' /><span>" + @_getFileBasename(filePath) + "</span></a>"
