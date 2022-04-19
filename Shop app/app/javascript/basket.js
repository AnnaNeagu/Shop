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
