import { extend } from "vee-validate";
import { required, alpha } from "vee-validate/dist/rules";

extend("required", {
  ...required,
  message: "មិនអាចបញ្ចូលតួអក្សរ ត្រូវបញ្ចូលជាលេខ"
});

extend("alpha", {
  ...alpha,
  message: "This field must only contain alphabetic characters"
});
