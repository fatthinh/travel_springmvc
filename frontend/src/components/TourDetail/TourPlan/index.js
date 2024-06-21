import React from 'react';

const TourPlan = ({ tourPlan }) => {
      return (
            <section className="plan__sec">
                  <div className="py-4">
                        <h2>Tour Plan</h2>
                  </div>
                  {tourPlan.map((item, index) => (
                        <div key={index} className="plan__con d-flex gap-5 mb-5 pb-3">
                              <div className="plan__sn d-md-block d-none">
                                    <p>0{item.day}</p>
                              </div>
                              <div lg={10} className="plan__box">
                                    <h4 className="mb-4">
                                          Day 0{item.day}: {item.activityId.name}
                                    </h4>
                                    <p className="mb-4">{item.activityId.description}</p>
                                    {/* <ul>
                                          {item.activities?.map((item, index) => (
                                                <li key={index}>
                                                      <i class="bi bi-check-lg"></i> {item}
                                                </li>
                                          ))}
                                    </ul> */}
                                    {/* <p className="mb-4">{item.activityId}</p> */}
                              </div>
                        </div>
                  ))}
            </section>
      );
};

export default TourPlan;
