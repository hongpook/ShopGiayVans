const $ = document.querySelector.bind(document)
const $$ = document.querySelector.bind(document)
const dotItems = $$('.dot-next-items')
const blogItems = $$('.van-new')

const imgItems = $$('.img-items')
const tabIimg = $$('.tab-img')

tabIimg.forEach((tab , index)=>{
    var imgItem = imgItems[index]
    tab.onclick = function(){
        $('.img-items.active').classList.remove('active')
        $('.tab-img.active').classList.remove('active')

        tab.classList.add('active')
        imgItem.classList.add('active')
    }
})








blogItems.forEach((tab , index)=>{
    tab.onclick = function(){
        $('.dot-next-items.active').classList.remove('active')
        tab.classList.add('active')
    }
})




