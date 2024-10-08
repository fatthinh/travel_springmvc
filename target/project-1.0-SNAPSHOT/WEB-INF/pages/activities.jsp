<%-- 
    Document   : activities.jsp
    Created on : Jun 15, 2024, 8:50:15 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="products-area-wrapper gridView">
    <c:forEach items="${activities}" var="activity">
        <div class="products-row js-toggle" toggle-target="#activity-details-${activity.getId()}">
            <button class="cell-more-button">
                <i class="bx bx-dots-vertical-rounded icon"></i>
            </button>

            <div class="product-cell image">
                <img
                    src="https://res.cloudinary.com/dzjhqjxqj/image/upload/v1718602988/pexels-photo-6985001_qj2uav.jpg"
                    alt="${activity.getName()}"
                    />
            </div>
            <div class="product-cell">
                <span class="cell-label">Name: </span>${activity.getName()}
            </div>
            <div class="product-cell">
                <span class="cell-label">Transport: </span>${activity.getTransport()}
            </div>
            <div class="product-cell">
                <span class="cell-label">Price: </span>$${activity.getPrice()}
            </div>
        </div>

        <!-- Modal: activity details -->
        <c:url value="/activities/${activity.getId()}" var="action" />
<!--        <div id="activity-details-${activity.getId()}" class="modal hide">
            <div class="modal__content" style="background-color: #fff; width: 650px">
        <form:form method="post" action="${action}" modelAttribute="activityObj" class="form">
            <h2 class="modal__heading">Details</h2>
            <div class="modal__body">
                <div class="form__row">
                    <div class="form__group">
                        <label for="name" class="form__label form__label--small"
                               >Name</label
                        >
                        <div class="form__text-input form__text-input--small">
            <form:input
                path="name"
                id="name"
                placeholder="Name"
                class="form__input"
                value="${activity.getName()}"
                />
        </div>
        <p class="form__error">Name must be at least 2 characters</p>
    </div>
    <div class="form__group">
        <label for="name" class="form__label form__label--small"
               >Price</label
        >
        <div class="form__text-input form__text-input--small">
            <form:input
                type="number"
                path="price"
                id="name"
                placeholder="Price"
                class="form__input"
                value="${activity.getPrice()}"

                />
        </div>
        <p class="form__error">Name must be at least 2 characters</p>
    </div>
</div>
<div class="form__group">
    <label for="destination" class="form__label form__label--small"
           >Destination</label
    >
    <div class="form__text-input form__text-input--small">
        <input
            type="text"
            placeholder="Destination"
            id="destinationDisplay"
            class="form__input js-toggle"
            toggle-target="#destination-dialog-${activity.getId()}"
            readonly
            value="${activity.getDestination().getName()}"
            />
            <form:input
                type="number"
                id="destination"
                path="destination"
                hidden="true"
                />
            <div id="destination-dialog-${activity.getId()}" class="form__select-dialog bottom hide">
                <h2 class="form__dialog-heading d-md-none">Destination</h2>
                <button
                    class="form__close-dialog d-md-none js-toggle"
                    toggle-target="#destination-dialog-${activity.getId()}"
                    >
                    &times
                </button>
                <div class="form__search">
                    <input
                        type="text"
                        placeholder="Search"
                        class="form__search-input"
                        />
                    <i class="bx bx-search form__search-icon icon"></i>
                </div>
                <ul class="form__options-list" data-name="destination">
            <c:forEach items="${destinations}" var="destination">
                <li class="form__option" data-id="${destination.getId()}">${destination.getName()}</li>
            </c:forEach>
    </ul>
</div>
</div>
</div>
<div class="form__group">
<label for="description" class="form__label form__label--small"
   >Description</label
>
<div class="form__text-area">
            <form:textarea
                path="description"
                id="description"
                class="form__text-area-input" 
                placeholder="${activity.getDescription()}"
                ></form:textarea>
            </div>
        </div>
    </div>

    <div class="modal__bottom">
        <button
            class="btn btn--small btn--text modal__btn js-toggle"
            toggle-target="#activity-details-${activity.getId()}"
        >
        Cancel
    </button>
    <button
        class="btn btn--small btn--primary modal__btn btn--no-margin "
        type="submit"
        >
        Create
    </button>
</div>
        </form:form>
    </div>
    <div class="modal__overlay"></div>
</div>-->
    </c:forEach>
</div>

<script type="text/javascript">
    const toDetail = (activity) => {
        console.log("Activity JSON:", activity);
    };
</script>