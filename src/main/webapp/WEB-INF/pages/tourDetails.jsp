<%-- 
    Document   : tourDetails
    Created on : Jun 22, 2024, 9:08:15 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<section class="single__page py-5 overflow-auto">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <section class="single__bio">
                    <main class="tour__info" style="font-size: 18px">
                        <section>
                            <a href="<c:url value="/tours"/>" class="btn btn-outline-primary d-flex align-items-center">
                                <i
                                    class="bx bx-left-arrow-alt"
                                    ></i>
                                <span>Back</span>
                            </a>
                        </section>
                        <section class="price d-flex align-items-center gap-2 py-2">

                            <h2>$${tourdetails.getPrice()}</h2>
                            <p>(Per Person)</p>
                        </section>
                        <section class="day__time d-md-flex gap-5 py-2">
                            <p>
                                <i class='bx bx-time'></i>                                        
                                ${tourplan.size()} Days / ${tourplan.size() + 1} Night
                            </p>
                            <p>
                                <i class='bx bx-group' ></i>                                       
                                Max People ${tourdetails.getCapacity()}
                            </p>
                            <p>
                                <i class='bx bx-map' ></i>                                        
                                ${tourdetails.getDestination().getName()}
                            </p>
                        </section>
                        <section class="desc py-2 d-flex flex-column gap-3 ">
                            <p>${tourdetails.getDescription()}</p>
                        </section>
                        <section class="image pb-5 pt-4">
                            <div class="py-4">
                                <h2>Gallery</h2>
                            </div>
                            <div class="row">
                                <c:forEach items="${tourgallery}" var="item">
                                    <div  class="col-lg-4 p-3">
                                        <img class="w-100" src="${item.getSrc()}" />
                                    </div>
                                </c:forEach>
                            </div>
                        </section>
                        <section class="plan__sec">
                            <div class="py-4">
                                <h2>Tour Plan</h2>
                            </div>
                            <ul class="sortable-list">
                                <c:forEach items="${tourplan}" var="item" varStatus="loop">
                                    <li class="plan__con d-flex gap-5 mb-5 pb-3 border-0 sortable-item" draggable="true">
                                        <div class="plan__sn d-md-block d-none">
                                            <p>0${loop.index + 1}</p>
                                        </div>
                                        <div lg={10} class="plan__box">
                                            <h4 class="mb-4">
                                                Day 0${loop.index + 1}: ${item.getActivityId().getName()}
                                            </h4>
                                            <p class="mb-4">${item.getActivityId().getDescription()}</p>
                                        </div>
                                    </li>    
                                </c:forEach>
                            </ul>
                        </section>
                    </main>
                </section>
            </div>
        </div>
    </div>
</section>

<script>
    const sortableList = $(".sortable-list");
    const items = $$(".sortable-item");

    items.forEach(item => {
        item.addEventListener("dragstart", () => {
            // Adding dragging class to item after a delay
            setTimeout(() => item.classList.add("dragging"), 0);
        });
        // Removing dragging class from item on dragend event
        item.addEventListener("dragend", () => item.classList.remove("dragging"));
    });

    const initSortableList = (e) => {
        e.preventDefault();
        const draggingItem = $(".dragging");
        // Getting all items except currently dragging and making array of them
        let siblings = [...sortableList.querySelectorAll(".sortable-item:not(.dragging)")];

        // Finding the sibling after which the dragging item should be placed
        let nextSibling = siblings.find(sibling => {
            return e.clientY <= (sibling.offsetTop + sibling.offsetHeight) / 3;
        });

        // Inserting the dragging item before the found sibling
        sortableList.insertBefore(draggingItem, nextSibling);
    };

    sortableList.addEventListener("dragover", (e) => {
        initSortableList(e);
    });
    sortableList.addEventListener("dragenter", e => e.preventDefault());
</script>