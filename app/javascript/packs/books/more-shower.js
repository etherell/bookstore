class MoreShower {
  constructor(readMoreButtonClass, description) {
    this.readMoreButton = $(readMoreButtonClass);
    this.description = description;
  }

  init() {
    this.readMoreButton.click((event) => {
      event.preventDefault();
      this.readMoreButton.parent().html(this.description);
    });
  }
}

new MoreShower(".read-more", gon.description).init();
