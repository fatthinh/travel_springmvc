import axios from 'axios';
import cookie from 'react-cookies';

export const BASE_URL = 'http://localhost:8082/project/api';

export const endpoints = {
      categories: 'categories/',
      'tour-detail': 'tour-detail/',
      'tour-detail-retrieve': (id) => `tour-detail/${id}/`,
      'tour-detail-gallery': (id) => `tour-detail/${id}/gallery/`,
      'tour-detail-activities': (id) => `tour-detail/${id}/activities/`,
      'tour-detail-available': (id) => `tour-detail/${id}/available/`,
      'ticket-types': 'ticket-types/',
      destinations: 'destinations/',
      book: 'book/',
      login: 'login/',
      'current-user': 'current-user/',
};

export const axiosConfigWithAuth = axios.create({
      baseURL: BASE_URL,
      headers: {
            Authorization: cookie.load('token'),
      },
});

export const axiosConfig = axios.create({
      baseURL: BASE_URL,
});
