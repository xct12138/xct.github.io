const signinBtn = document.getElementById("signin");
const signupBtn = document.getElementById("signup");
const firstFrom = document.getElementById("form1");
const secondFrom = document.getElementById("form2");
const container = document.getElementById(".container");


signinBtn.addEventListener("click",()=>{
    container.classList.remove("right-panel-active");
});
signupBtn.addEventListener("click",()=>{
    container.classList.add("right-panel-active");
});

//firstFrom.addEventListener("submit",(e)=>e.preventDefault());
//secondFrom.addEventListener("submit",(e)=>e.preventDefault());