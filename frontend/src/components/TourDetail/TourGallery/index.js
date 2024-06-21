import React, { useState } from 'react';
import { Col, Modal, Row } from 'react-bootstrap';

const TourGallery = ({ gallery }) => {
      const [show, setShow] = useState(false);
      const [selectedImage, setSelectedImage] = useState();

      const handleClose = (index) => {
            setShow(false);
      };
      const handleShow = (index) => {
            console.log(index);
            setShow(true);
            setSelectedImage(index);
      };
      return (
            <section className="gallery__sec">
                  <Row className="py-4">
                        {gallery.map((item, index) => (
                              <Col lg={4} key={index} className="mb-4">
                                    <img className="w-100" src={item?.src} onClick={() => handleShow(index)} />
                              </Col>
                        ))}
                  </Row>
                  <Modal show={show} onHide={handleClose} className="d-flex justify-content-center align-items-center">
                        <Modal.Body>
                              <img className="w-100" src={gallery[selectedImage]?.src} />
                        </Modal.Body>
                  </Modal>
            </section>
      );
};

export default TourGallery;
