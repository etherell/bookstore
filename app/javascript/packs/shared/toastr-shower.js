$(document).ready(() => {
  if (!gon.flash) return false;

  let flash_name = gon.flash[0][0];
  let flash_message = gon.flash[0][1];

  switch (flash_name) {
    case "error":
     return toastr.error(flash_message);
    case "succes":
      return toastr.success(flash_message);
    default:
      return toastr.info(flash_message);
  }
});
