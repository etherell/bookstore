class PriceCalculator {
  constructor(quantityInputClass, incrementButtonClass, decrementButtonClass, bookPriceClass) {
    this.quantityInput = $(quantityInputClass);
    this.incrementButton = $(incrementButtonClass);
    this.decrementButton = $(decrementButtonClass);
    this.bookPrice = $(bookPriceClass)
    this.basePrice = parseFloat(this.bookPrice.text().replace('€', '')).toFixed(2)
  }

  init() {
    this.decrementClick();
    this.incrementClick();
    this.inputNumber();
  }

  decrementClick() {
    this.decrementButton.click(() => {
      let inputValue = Number(this.quantityInput.val());
      if (inputValue > 1) {
        let newVal = inputValue - 1;
        this.quantityInput.val(newVal);
        this.changePrice()
      }
    });
  }

  incrementClick() {
    this.incrementButton.click(() => {
      let inputValue = Number(this.quantityInput.val());
      if (inputValue >= 1) {
        let newVal = inputValue + 1;
        this.quantityInput.val(newVal);
      } else {
        this.quantityInput.val(1);
      }
      this.changePrice()
    });
  }

  inputNumber() {
    this.quantityInput.on("input", () => {
      this.changePrice()
    })
  }

  changePrice() {
    let inputValue = Number(this.quantityInput.val());
    if (inputValue >= 1) {
      price = (inputValue * this.basePrice).toFixed(2)
    } else {
      price = this.basePrice
    }
    this.bookPrice.text('€' + price)
  }
}

new PriceCalculator(".quantity-input", ".fa-plus", ".fa-minus", ".book-price").init();
