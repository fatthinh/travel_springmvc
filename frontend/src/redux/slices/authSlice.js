import { createSlice } from '@reduxjs/toolkit';
import cookie from 'react-cookies';

export default createSlice({
      name: 'auth',
      initialState: {
            user: null,
      },
      reducers: {
            login: (state, action) => {
                  state.user = action.payload;
            },
            logout: (state) => {
                  state.user = null;
                  cookie.remove('token');
            },
      },
});
