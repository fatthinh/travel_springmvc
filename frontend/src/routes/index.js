import config from '~/config';
import Home from '~/pages/Home';
import Login from '~/pages/Login';
import TourList from '~/pages/TourList';
import TourDetail from '~/pages/TourDetail';
import TourFilter from '~/pages/TourFilter';
import DestinationList from '~/pages/DestinationList';
import Blogs from '~/pages/Blog';
import Checkout from '~/pages/Checkout';

export const publicRoutes = [
      { path: config.routes.home, component: Home },
      { path: config.routes.login, component: Login, layout: null },
      { path: config.routes.tourList, component: TourList },
      { path: config.routes.tourDetail, component: TourDetail },
      { path: config.routes.tourFilter, component: TourFilter },
      { path: config.routes.destinationList, component: DestinationList },
      { path: config.routes.blogs, component: Blogs },
      { path: config.routes.checkout, component: Checkout },
];

export const privateRoutes = [];
