import { createSlice } from '@reduxjs/toolkit';

export default createSlice({
      name: 'filters',
      initialState: {
            search: '',
            destination: '',
            categories: [],
      },
      reducers: {
            searchFilterChange: (state, action) => {
                  state.search = action.payload;
            },
            destinationFilterChange: (state, action) => {
                  state.destination = action.payload;
            },
            categoriesFilterChange: (state, action) => {
                  state.categories = action.payload;
            },
      },
});
