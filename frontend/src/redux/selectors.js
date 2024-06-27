import { createSelector } from '@reduxjs/toolkit';

export const authSelector = (state) => state.auth.user;

export const bookingSelector = (state) => state.booking;

export const commonSelector = (state) => state.common;
export const searchFilterSelector = (state) => state.filters.search;
export const destinationFilterSelector = (state) => state.filters.destination;
export const categoriesFilterSelector = (state) => state.filters.categories;
const tours = (state) => state.common.tours;

export const filterSelector = createSelector(
      tours,
      searchFilterSelector,
      destinationFilterSelector,
      categoriesFilterSelector,
      (tours, search, destination, categories) => {
            const filteredDestination = tours.filter((item) => {
                  if (destination === 'Where To') {
                        return item;
                  } else {
                        return item.destination.name.includes(destination);
                  }
            });

            const filterCategories = filteredDestination.filter((item) => {
                  return categories.every((category) => {
                        return item.categoryCollection.some((itemCategory) => {
                              return itemCategory.name === category;
                        });
                  });
            });
            return filterCategories;
      },
);
