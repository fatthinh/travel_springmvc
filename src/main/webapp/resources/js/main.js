const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

/**
 * JS toggle
 *
 * Cách dùng:
 * <button class="js-toggle" toggle-target="#box">Click</button>
 * <div id="box">Content show/hide</div>
 */
function initJsToggle() {
    $$(".js-toggle").forEach((button) => {
        const target = button.getAttribute("toggle-target");
        if (!target) {
            document.body.innerText = `Cần thêm toggle-target cho: ${button.outerHTML}`;
        }
        button.onclick = (e) => {
            e.preventDefault();

            if (!$(target)) {
                return (document.body.innerText = `Không tìm thấy phần tử "${target}"`);
            }
            const isHidden = $(target).classList.contains("hide");

            requestAnimationFrame(() => {
                $(target).classList.toggle("hide", !isHidden);
                $(target).classList.toggle("show", isHidden);
            });
        };

        document.onclick = function (e) {
            if (!e.target.closest(target)) {
                const isHidden = $(target).classList.contains("hide");
                if (!isHidden) {
                    button.click();
                }
            }
        };
    });
}

document.addEventListener("DOMContentLoaded", () => {
    initJsToggle();

    $$(".form__option").forEach((item) => {
        item.addEventListener("click", (e) => {
            const target = e.target.closest(".form__options-list");

            if (target.classList.contains("multi-select")) {
                e.target.classList.toggle("form__option--current");
                const categoriesDisplay = [];

                target.querySelectorAll(".form__option").forEach((item) => {
                    if (item.classList.contains("form__option--current")) {
                        categoriesDisplay.push(item.innerHTML);
                    }
                });

                $(`#${target.dataset.name}Display`).value = categoriesDisplay;

                let body = target.getAttribute("data-id") ? JSON.stringify({
                    first_obj: target.dataset.id,
                    second_obj: e.target.dataset.id
                }) : JSON.stringify({
                    second_obj: e.target.dataset.id
                });

                fetch("http://localhost:8082/project/api/tour-category/", {
                    method: "post",
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },

                    body: body
                })
                        .then((response) => response.json())
                        .then((data) => {
                            console.log(data);
                        });
            } else {
                target.querySelectorAll(".form__option").forEach((item) => {
                    item.classList.remove("form__option--current");
                });
                $(`#${target.dataset.name}`).value = e.target.dataset.id;
                $(`#${target.dataset.name}Display`).value = e.target.innerHTML;
                e.target.classList.add("form__option--current");
            }
        });
    });

    $$(".gallery-item").forEach((item) => {
        item.addEventListener("click", (e) => {
            const target = e.target.closest(".modal");
            const body = target.getAttribute("data-id") ? JSON.stringify({
                first_obj: target.dataset.id,
                second_obj: e.target.dataset.id
            }) : JSON.stringify({
                second_obj: e.target.dataset.id
            });

            switch (target.id) {
                case "image-gallery":
                    addToGallery("http://localhost:8082/project/api/tour-gallery/", body);
                    break;
                case "activity-gallery":
                    addToGallery("http://localhost:8082/project/api/tour-activity/", body);
                    break;
            }
        });
    });


    $(".jsFilter")?.addEventListener("click", function () {
        $(".filter-menu").classList.toggle("active");
    });

    $$(".sidebar-list-item a").forEach(item => {
        if (item.getAttribute("href") === location.pathname) {
            item.closest(".sidebar-list-item").classList.add("active");
        }
    });
});

const addToGallery = (url, body) => {
    fetch(url, {
        method: "post",
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },

        body: body
    })
            .then((response) => response.json())
            .then((data) => {
                console.log(data);
            });
};