class ButtonDisabler {
  constructor() {
    this.checkbox = $(".form-group.checkbox");
    this.checkboxInput = $(".checkbox-input");
    this.removeAccountButton = $(".remove-account-btn");
  }

  init() {
    this.onCheckboxChecked();
  }

  onCheckboxChecked() {
    this.checkbox.click(() => {
      let status = this.checkboxInput.is(":checked");
      this.removeAccountButton.prop("disabled", !status);
    });
  }
}

new ButtonDisabler().init();
