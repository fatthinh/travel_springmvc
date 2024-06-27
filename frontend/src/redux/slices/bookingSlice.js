import { createSlice } from '@reduxjs/toolkit';

export default createSlice({
      name: 'booking',
      initialState: {
            adults: 1,
            children: 0,
            tourId: null,
      },
      reducers: {
            setAdults: (state, action) => {
                  state.adults = action.payload;
            },
            setChildren: (state, action) => {
                  state.children = action.payload;
            },
            setTourId: (state, action) => {
                  state.tourId = action.payload;
            },
      },
});
