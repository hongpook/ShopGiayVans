const product = document.querySelector('.product-right-slide')
const product_2 = document.querySelector('.product-right-slide-2')
const product_3 = document.querySelector('.product-right-slide-3')

const list = [
    {
        image: "../Images/vans-authentic-classic-black-3.jpg",
        imgSl_1: "../Images/vans-authentic-classic-black-1.jpg",
        imgSl_2: "../Images/vans-authentic-classic-black-2.jpg",
        imgSl_3: "../Images/vans-authentic-classic-black-3.jpg",
        imgSl_4: "../Images/vans-authentic-classic-black-4.jpg",
        imgSl_5: "../Images/vans-authentic-classic-black-5.jpg",
        title : "VANS AUTHENTIC CLASSIC BLACK/WHITE",
        price : "1.450.000",
    },
    {
        image: "../Images/vans-old-skool-black-white/vans-old-skool-black-white-3.jpg",
        imgSl_1: "../Images/vans-old-skool-black-white/vans-old-skool-black-white-1.jpg",
        imgSl_2: "../Images/vans-old-skool-black-white/vans-old-skool-black-white-2.jpg",
        imgSl_3: "../Images/vans-old-skool-black-white/vans-old-skool-black-white-3.jpg",
        imgSl_4: "../Images/vans-old-skool-black-white/vans-old-skool-black-white-4.jpg",
        imgSl_5: "../Images/vans-old-skool-black-white/vans-old-skool-black-white-5.jpg",
        title : "VANS OLD SKOOL CLASSIC BLACK/WHITE",
        price : "1.750.000",
    },
    {
        image: "../Images/vans-slip-on-checkerboard-black-off-white/vans-slip-on-checkerboard-black-off-white-3.jpg",
        imgSl_1: "../Images/vans-slip-on-checkerboard-black-off-white/vans-slip-on-checkerboard-black-off-white-1.jpg",
        imgSl_2: "../Images/vans-slip-on-checkerboard-black-off-white/vans-slip-on-checkerboard-black-off-white-2.jpg",
        imgSl_3: "../Images/vans-slip-on-checkerboard-black-off-white/vans-slip-on-checkerboard-black-off-white-3.jpg",
        imgSl_4: "../Images/vans-slip-on-checkerboard-black-off-white/vans-slip-on-checkerboard-black-off-white-4.jpg",
        imgSl_5: "../Images/vans-slip-on-checkerboard-black-off-white/vans-slip-on-checkerboard-black-off-white-5.jpg",
        title : "VANS CHECKERBOARD SLIP-ON CLASSIC BLACK/OFF WHITE",
        price : "1.450.000",
    },
    {
        image: "../Images/vans-old-skool-classic-true-white/vans-old-skool-classic-true-white-3.jpg",
        imgSl_1: "../Images/vans-old-skool-classic-true-white/vans-old-skool-classic-true-white-1.jpg",
        imgSl_2: "../Images/vans-old-skool-classic-true-white/vans-old-skool-classic-true-white-2.jpg",
        imgSl_3: "../Images/vans-old-skool-classic-true-white/vans-old-skool-classic-true-white-3.jpg",
        imgSl_4: "../Images/vans-old-skool-classic-true-white/vans-old-skool-classic-true-white-4.jpg",
        imgSl_5: "../Images/vans-old-skool-classic-true-white/vans-old-skool-classic-true-white-5.jpg",
        title : "VANS CANVAS OLD SKOOL CLASSIC TRUE WHITE",
        price : "1.750.000",
    },
    {
        image: "../Images/vans-old-skool-classic-black-black/vans-old-skool-classic-black-black-3.jpg",
        imgSl_1: "../Images/vans-old-skool-classic-black-black/vans-old-skool-classic-black-black-1.jpg",
        imgSl_2: "../Images/vans-old-skool-classic-black-black/vans-old-skool-classic-black-black-2.jpg",
        imgSl_3: "../Images/vans-old-skool-classic-black-black/vans-old-skool-classic-black-black-3.jpg",
        imgSl_4: "../Images/vans-old-skool-classic-black-black/vans-old-skool-classic-black-black-4.jpg",
        imgSl_5: "../Images/vans-old-skool-classic-black-black/vans-old-skool-classic-black-black-5.jpg",
        title : "VANS OLD SKOOL CLASSIC BLACK/BLACK",
        price : "1.750.000",
    },
    {
        image: "../Images/vans-old-skool-classic-navy-white/vans-old-skool-classic-navy-white-3.jpg",
        imgSl_1: "../Images/vans-old-skool-classic-navy-white/vans-old-skool-classic-navy-white-1.jpg",
        imgSl_2: "../Images/vans-old-skool-classic-navy-white/vans-old-skool-classic-navy-white-2.jpg",
        imgSl_3: "../Images/vans-old-skool-classic-navy-white/vans-old-skool-classic-navy-white-3.jpg",
        imgSl_4: "../Images/vans-old-skool-classic-navy-white/vans-old-skool-classic-navy-white-4.jpg",
        imgSl_5: "../Images/vans-old-skool-classic-navy-white/vans-old-skool-classic-navy-white-5.jpg",
        title : "VANS OLD SKOOL CLASSIC NAVY/WHITE",
        price : "1.750.000",
    },
    {
        image: "../Images/vans-sk8-hi-classic-black-white/vans-sk8-hi-classic-black-white-3.jpg",
        imgSl_1: "../Images/vans-sk8-hi-classic-black-white/vans-sk8-hi-classic-black-white-1.jpg",
        imgSl_2: "../Images/vans-sk8-hi-classic-black-white/vans-sk8-hi-classic-black-white-2.jpg",
        imgSl_3: "../Images/vans-sk8-hi-classic-black-white/vans-sk8-hi-classic-black-white-3.jpg",
        imgSl_4: "../Images/vans-sk8-hi-classic-black-white/vans-sk8-hi-classic-black-white-4.jpg",
        imgSl_5: "../Images/vans-sk8-hi-classic-black-white/vans-sk8-hi-classic-black-white-5.jpg",
        title : "VANS CLASSIC SK8-HI BLACK/WHITE",
        price : "1.950.000",
    },
]


function render (){
    const htmls = list.map((item) =>{
        return `
        <div class="product-right-items">
            <div class="product-img">
                <a href="#"><img src=${item.image} alt=""></a>
                <div class="btn-option">
                    <a href="#">Tùy Chọn</a>
                </div>
            </div>
            <div class="product-info">
                <div class="product-img-slide-body">
                    <div class="product-slide">
                        <div class="product-img-slide ">
                            <img src=${item.imgSl_1} alt="">
                            <img src=${item.imgSl_2} alt="">
                            <img src=${item.imgSl_3} alt="">
                            <img src=${item.imgSl_4} alt="">
                            <img src=${item.imgSl_5} alt="">
                        </div>
                    </div>
                    <div class="btn-prev"><i class="fa-solid fa-angle-left"></i></div>
                    <div class="btn-next"><i class="fa-solid fa-angle-right"></i></i></div>
                </div>
                <h3><a href="#">${item.title}</a></h3>
                <div class="product-price">
                    <a href="#">VANS</a>
                    <span>${item.price}<sup>₫</sup></span>
                </div>
            </div>
        </div>
        `
    })
    product.innerHTML = htmls.join("")


    const htmlss = list.map((itemm) =>{
        return `
        <div class="product-right-items">
            <div class="product-img">
                <a href="#"><img src=${itemm.image} alt=""></a>
                <div class="btn-option">
                    <a href="#">Tùy Chọn</a>
                </div>
            </div>
            <div class="product-info">
                <div class="product-img-slide-body">
                    <div class="product-slide">
                        <div class="product-img-slide ">
                            <img src=${itemm.imgSl_1} alt="">
                            <img src=${itemm.imgSl_2} alt="">
                            <img src=${itemm.imgSl_3} alt="">
                            <img src=${itemm.imgSl_4} alt="">
                            <img src=${itemm.imgSl_5} alt="">
                        </div>
                    </div>
                    <div class="btn-prev"><i class="fa-solid fa-angle-left"></i></div>
                    <div class="btn-next"><i class="fa-solid fa-angle-right"></i></i></div>
                </div>
                <h3><a href="#">${itemm.title}</a></h3>
                <div class="product-price">
                    <a href="#">VANS</a>
                    <span>${itemm.price}<sup>₫</sup></span>
                </div>
            </div>
        </div>
        `
    })
    product_2.innerHTML = htmlss.join("")



    const htmlsss = list.map((itemmm) =>{
        return `
        <div class="product-right-items">
            <div class="product-img">
                <a href="#"><img src=${itemmm.image} alt=""></a>
                <div class="btn-option">
                    <a href="#">Tùy Chọn</a>
                </div>
            </div>
            <div class="product-info">
                <div class="product-img-slide-body">
                    <div class="product-slide">
                        <div class="product-img-slide ">
                            <img src=${itemmm.imgSl_1} alt="">
                            <img src=${itemmm.imgSl_2} alt="">
                            <img src=${itemmm.imgSl_3} alt="">
                            <img src=${itemmm.imgSl_4} alt="">
                            <img src=${itemmm.imgSl_5} alt="">
                        </div>
                    </div>
                    <div class="btn-prev"><i class="fa-solid fa-angle-left"></i></div>
                    <div class="btn-next"><i class="fa-solid fa-angle-right"></i></i></div>
                </div>
                <h3><a href="#">${itemmm.title}</a></h3>
                <div class="product-price">
                    <a href="#">VANS</a>
                    <span>${itemmm.price}<sup>₫</sup></span>
                </div>
            </div>
        </div>
        `
    })
    product_3.innerHTML = htmlsss.join("")



}

render();