class LolitaFileUploadGallery
  @_instance: null
  _initialized: false
  _imageQueue: []

  @buttonTitle = ""
  @buttonImage = ""

  GALLERY_SELECTOR = "#fixed-gallery"
  SLIDER_SELECTOR = "#fixed-gallery .slider"
  CLOSE_BUTTON_SELECTOR = "#fixed-gallery .close"
  TAPE_SELECTOR = "#fixed-gallery .slider ul"
  IMAGE_SELECTOR = "#fixed-gallery .slider li img"

  @get: ->
    if not @_instance?
      @_instance = new @
    @_instance

  init: ->
    @_observeImageDropping()
    @_createSlider()
    @_addImagesToDOM()
    @_observeCloseButton()
    @_addButtonToTinyMCE()
    @._initialized = true

  toggle: ->
    @_gallery().toggle()
    @_slider().elastislide("refresh")

  add: (filePath, originalFilePath) ->
    if @_isImagePath(filePath)
      $imageContainer = @_imageContainer(filePath, originalFilePath)
      if @._initialized
        @_addToDOM($imageContainer)
      else
        @_addToQueue($imageContainer)

  _observeImageDropping: ->
    tinyMCE.onAddEditor.add( (mgr, editor) =>
      @_observeDropOnTinyMCEEditor(editor)
    )

  _createSlider: ->
    @_slider().elastislide({
      imageW: 100
      border: 2
      margin: 5
    })

  _makeImagesDraggable: ->
    $(IMAGE_SELECTOR).draggable("destroy")
    $(IMAGE_SELECTOR).draggable({
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

  _addButtonToTinyMCE: ->
    TinyMCEConfigManager.get().config.addAfter("buttons", "gallery", "image")
    TinyMCEConfigManager.get().config.addFunction("setup", (editor) ->
      editor.addButton("gallery", {
        title: LolitaFileUploadGallery.buttonTitle
        image: LolitaFileUploadGallery.buttonImage
        onclick: ->
         LolitaFileUploadGallery.get().toggle()
      })
    )

  _gallery: ->
    $(GALLERY_SELECTOR)

  _slider: ->
    $(SLIDER_SELECTOR)

  _isImagePath: (filePath) ->
    filePath.match(/\.(jpg|jpeg|gif|png|ico)$/)

  _tape: ->
    $(TAPE_SELECTOR)

  _imageContainer: (imagePath, originalImagePath) ->
    $("<li><a href='#'>" + @_imageTag(imagePath, originalImagePath) + "</a></li>")

  _imageTag: (imagePath, originalImagePath) ->
    "<img src='"+ imagePath + "' alt='" + imagePath + "' data-original-url='" + originalImagePath + "' />"

  _addToDOM: ($imageContainer) ->
    @_tape().append($imageContainer)
    @_slider().elastislide("add", $imageContainer)
    @_makeImagesDraggable()

  _addToQueue: ($imageContainer) ->
    @._imageQueue.push($imageContainer)

  _observeDropOnTinyMCEEditor: (newEditor) ->
    self = this
    newEditor.onInit.add( (editor) ->
      $(editor.contentDocument).ready ->
        self._editorContainer(editor).droppable({
          drop: (event, ui) =>
            editor.selection.setContent(self._insertableImageTag(ui.draggable))
        })
    )

  _editorContainer: (editor) ->
    $("#" + editor.editorContainer).find(".mceIframeContainer")

  _insertableImageTag: (draggableImage) ->
    imageSrc = draggableImage.data("original-url")
    "<img src='" + imageSrc + "' alt='" + imageSrc + "' />"


window.LolitaFileUploadGallery = LolitaFileUploadGallery
