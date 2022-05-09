function apply_discount(code) {
  let data = { code: code };

  fetch("http://localhost:3000/discount", {
    method: "PUT",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data),
  }).then(() => {
    window.location.reload();
  });
}

function checkout(discount = 0) {
  let data = {
    discount: discount,
  };
  fetch("http://localhost:3000/baskets", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data),
  }).then(() => {
    window.location.replace("/");
  });
}
