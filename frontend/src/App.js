import { BrowserRouter as Router, Routes, Route, useFetcher } from 'react-router-dom';
import { publicRoutes } from '~/routes';
import { DefaultLayout } from '~/layout';
import { Fragment, useEffect } from 'react';
import { useDispatch } from 'react-redux';
import commonSlice from './redux/slices/commonSlice';
import config from './config';
import useFetch from './hooks/useFetch';

function App() {
      const dispatch = useDispatch();

      const { data: tours } = useFetch(`${config.BASE_URL}/${config.endpoints['tour-detail']}`);
      const { data: destinations } = useFetch(`${config.BASE_URL}/${config.endpoints.destinations}`);
      const { data: categories } = useFetch(`${config.BASE_URL}/${config.endpoints.categories}`);

      useEffect(() => {
            const timer = setTimeout(() => {
                  dispatch(commonSlice.actions.setTours(tours));
                  dispatch(commonSlice.actions.setDestinations(destinations));
                  dispatch(commonSlice.actions.setCategories(categories));
            }, 500);

            return () => clearTimeout(timer);
      });

      return (
            <Router>
                  <div className="App">
                        <Routes>
                              {publicRoutes.map((route, index) => {
                                    const Page = route.component;
                                    let Layout = DefaultLayout;

                                    if (route.layout) {
                                          Layout = route.layout;
                                    } else if (route.layout === null) {
                                          Layout = Fragment;
                                    }

                                    return (
                                          <Route
                                                key={index}
                                                path={route.path}
                                                element={
                                                      <Layout>
                                                            <Page />
                                                      </Layout>
                                                }
                                          />
                                    );
                              })}
                        </Routes>
                  </div>
            </Router>
      );
}

export default App;
