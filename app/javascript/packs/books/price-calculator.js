class PriceCalculator {
  constructor(currency, booksQuantity) {
    this.quantityInput = $(".quantity-input");
    this.incrementButton = $(".fa-plus");
    this.decrementButton = $(".fa-minus");
    this.bookPrice = $(".book-price");
    this.currency = currency;
    this.basePrice = this.calculateBasePrice();
    this.booksQuantity = booksQuantity;
  }

  init() {
    this.onDecrementClick();
    this.onIncrementClick();
    this.onNumberInput();
  }

  calculateBasePrice() {
    return parseFloat(this.bookPrice.text().replace(this.currency, "")).toFixed(
      2
    );
  }

  onDecrementClick() {
    this.decrementButton.click(() => {
      let inputValue = Number(this.quantityInput.val());
      if (inputValue > 1) {
        let newVal = inputValue - 1;
        this.quantityInput.val(newVal);
        this.changePrice();
      }
    });
  }

  onIncrementClick() {
    this.incrementButton.click(() => {
      this.changeQuanity(1);
      this.changePrice();
    });
  }

  onNumberInput() {
    this.quantityInput.on("input", () => {
      this.changeQuanity(0);
      this.changePrice();
    });
  }

  changeQuanity(increment) {
    let inputValue = Number(this.quantityInput.val());
    if (inputValue >= 1 && inputValue < this.booksQuantity) {
      let newVal = inputValue + increment;
      this.quantityInput.val(newVal);
    } else if (inputValue < 1) {
      this.quantityInput.val(1);
    } else {
      this.quantityInput.val(this.booksQuantity);
    }
  }

  changePrice() {
    let inputValue = Number(this.quantityInput.val());
    let price = (inputValue * this.basePrice).toFixed(2);

    this.bookPrice.text(`${this.currency}${price}`);
  }
}

new PriceCalculator(gon.currency, gon.quantity).init();
