class Payment {
    @JsonProperty('currency')
    @SerializeAs('currency')
    Decimal amount;
}

String payload = '{"currency": 100}';

Payment myPayment;
myPayment = (Payment) JSON.deserialize(payload, Payment.class);

System.debug(myPayment); // {currency=100}

String serialized = JSON.serialize(myPayment);

System.debug(serialized); // {"currency":100}
