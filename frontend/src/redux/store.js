import { configureStore } from '@reduxjs/toolkit';
import authSlice from './slices/authSlice';
import commonSlice from './slices/commonSlice';
import filterSlice from './slices/filterSlice';
import bookingSlice from './slices/bookingSlice';

const store = configureStore({
      reducer: {
            auth: authSlice.reducer,
            common: commonSlice.reducer,
            filters: filterSlice.reducer,
            booking: bookingSlice.reducer,
      },
});

export default store;
