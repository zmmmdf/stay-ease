/**
 * Maximum number of guests allowed in the input
 */
export const MAX_GUESTS_INPUT_VALUE = 10;

/**
 * Messages related to user registration.
 */
export const REGISTRATION_MESSAGES = {
  SUCCESS: 'User created successfully. Redirecting to login...',
};

/**
 * Messages related to user login.
 */
export const LOGIN_MESSAGES = {
  FAILED: 'Please enter valid email and password',
};

/**
 * Represents the default tax details for hotel booking.
 */
export const DEFAULT_TAX_DETAILS =
  'VAT: The standard rate of VAT is 18%';

/**
 * Sorting filter labels
 */
export const SORTING_FILTER_LABELS = Object.freeze({
  PRICE_LOW_TO_HIGH: 'Price: Low to High',
  PRICE_HIGH_TO_LOW: 'Price: High to Low',
  RATING_LOW_TO_HIGH: 'Rating: Low to High',
  RATING_HIGH_TO_LOW: 'Rating: High to Low',
});
