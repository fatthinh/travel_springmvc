import Footer from './Footer';
import Header from './Header';
import TopHeader from './TopHeader';

function DefaultLayout({ children }) {
      return (
            <>
                  <TopHeader />
                  <Header />
                  <div className="children">{children}</div>
                  <Footer />
            </>
      );
}

export default DefaultLayout;
