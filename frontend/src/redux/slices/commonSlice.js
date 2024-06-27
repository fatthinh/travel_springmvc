import { createSlice } from '@reduxjs/toolkit';

export default createSlice({
      name: 'common',
      initialState: {
            tours: [],
            categories: [],
            destinations: [],
            destinationsFilter: [],
      },
      reducers: {
            setTours: (state, action) => {
                  state.tours = action.payload;
            },
            setCategories: (state, action) => {
                  const categories = action.payload;
                  state.categories = categories.map((item) => item.name);
            },
            setDestinations: (state, action) => {
                  const destinations = action.payload;
                  state.destinationsFilter = destinations.map((item) => item.name);
                  state.destinations = action.payload;
            },
      },
});
