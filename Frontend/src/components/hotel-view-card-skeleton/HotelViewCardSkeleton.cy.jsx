import React from 'react';
import HotelViewCardSkeleton from './HotelViewCardSwkeleton';

describe('<HotelViewCardSkeleton />', () => {
  it('renders', () => {
    // see: https://on.cypress.io/mounting-react
    cy.mount(<HotelViewCardSkeleton />);
  });
});
