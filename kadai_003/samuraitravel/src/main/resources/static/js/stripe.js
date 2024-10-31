const stripe = Stripe('pk_test_51QDpPiGjDNAAKHJX9ZCHZOOLnWy3tbKXirvDwnG3omzRfmFqL9Bj5QWPeDtiOcZnOtChE9jwhxrXpE3odFXji74E00VXAIYZGF');
const paymentButton = document.querySelector('#paymentButton');

paymentButton.addEventListener('click', () => {
	stripe.redirectToCheckout({
		sessionId: sessionId
	})
});