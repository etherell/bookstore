class MoreShower {
  constructor(readMoreButtonClass, description) {
    this.readMoreButton = $(readMoreButtonClass);
    this.description = description
  }

  show() {
    this.readMoreButton.click((event) => {
      event.preventDefault()
      this.readMoreButton.parent().html(this.description)
    })
  }
}

window.MoreShower = MoreShower
