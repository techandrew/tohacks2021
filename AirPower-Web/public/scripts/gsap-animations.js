function gsapAnimator() {
  const hero_controller = new ScrollMagic.Controller();
  const hero_scroll_timeline = new TimelineMax();

  hero_scroll_timeline
    .set(".mac__wrapper", {
      top: "0%",
      scale: 2,
    })

    .set("#top__left__1", {
      x: "-250%",
      y: "-250%",
      scale: 1.5,
    })

    .set(".promotion__text", {
      opacity: 0,
      backgroundSize: "0%",
    })

    .set("#top__left__bottom", {
      x: "-250%",
      scale: 1.5,
    })

    .set("#top__left__2", {
      x: "50%",
      y: "50%",
      opacity: 0,
    })

    .set("#top__left__bottom__2", {
      x: "75%",
      y: "75%",
      opacity: 0,
    })
    .set("#top__right", {
      x: "250%",
      y: "-250%",
      scale: 1.5,
    })
    .set("#bottom__left", {
      x: "-150%",
      y: "150%",
      scale: 1.5,
    })
    .set(".app__informatic__1", {
      x: "50%",
    })
    .set("#bottom__right", {
      x: "250%",
      y: "250%",
      scale: 1.5,
    })
    .to(".nav__wrapper", 2, {
      //   opacity: 0,
      top: "-100%",
    })
    .to(
      ".mac__wrapper",
      4,
      {
        scale: 1,
        y: "12.5%",
        top: "0%",
        bottom: "0%",
      },
      "-=2"
    )

    .set(".complaints__info__text", {
      x: "60%",
    })
    .set(".theft__info__text", {
      x: "-60%",
    })

    .to(
      ".mac__text",
      1,
      {
        opacity: 0,
      },
      "-=4"
    )
    .to(
      "#top__left__1",
      2,
      {
        x: "0%",
        y: "0%",
        scale: 1.0,
      },
      "-=3"
    )
    .to(
      "#top__left__bottom",
      1,
      {
        x: "0%",
        scale: 1.0,
      },
      "-=2"
    )

    .to(
      "#top__left__2",
      1,
      {
        x: "0%",
        y: "0%",
        opacity: 1,
        scale: 1.0,
      },
      "-=1"
    )

    .to(
      "#top__left__bottom__2",
      1,
      {
        x: "0%",
        y: "0%",
        opacity: 1,
      },
      "-=0.5"
    )
    .to(
      "#top__right",
      3,
      {
        x: "0%",
        y: "0%",
        scale: 1.0,
      },
      "-=3"
    )
    .to(
      "#bottom__left",
      2,
      {
        x: "0%",
        y: "0%",
        scale: 1,
      },
      "-=3"
    )
    .to(
      "#bottom__right",
      2,
      {
        x: "0%",
        y: "0%",
        scale: 1,
      },
      "-=2"
    )
    .to(".mac__wrapper", 2, {
      y: "5%",
      scale: 0.95,
      // position:"fixed",
      // top: "-25%",
      // bottom: "25%",
    })
    .to(
      ".promotion__text",
      1.5,
      {
        y: "-75%",
        backgroundSize: "500%",
        opacity: 1,
      },
      "-=1.5"
    )
    .to(".promotion__text", 1, {
      y: "-150%",
      backgroundSize: "0%",
      opacity: 0,
    })
    .to(".mac__wrapper", 2, {
      y: "0%",
      x: "-75%",
      scale: 1.75,
      // position:"fixed",
      // top: "-25%",
      // bottom: "25%",
    })
    .to(
      "#bottom__right",
      1,
      {
        x: "75%",
        y: "-50%",
        scale: 1.5,
      },
      "-=0.5"
    )
    .to(".complaints__info__text", 1, {
      y: "-400%",
      backgroundSize: "500%",
    })
    .to(".complaints__info__text", 1, {
      y: "-750%",
      backgroundSize: "0%",
      opacity: 0,
    })
    .to(
      "#bottom__right",
      1,
      {
        x: "0%",
        y: "0%",
        scale: 1,
      },
      "-=0.5"
    )
    .to(".mac__wrapper", 2, {
      y: "0%",
      x: "65%",
      scale: 1.75,
      // position:"fixed",
      // top: "-25%",
      // bottom: "25%",
    })
    .to("#top__left__bottom", 1, {
      x: "-50%",
      scale: 1.5,
    })
    .to(".theft__info__text", 1, {
      y: "-400%",
      backgroundSize: "500%",
    })
    .to(".theft__info__text", 1, {
      y: "-750%",
      backgroundSize: "0%",
      opacity: 0,
    })
    .to("#top__left__bottom", 1, {
      x: "0%",
      scale: 1,
    })
    .to("#bottom__left", 1.5, {
      x: "-100%",
      scale: 3.5,
    })
    .to(
      ".map__cluster__overlay",
      1,
      {
        display: "flex",
        opacity: 1,
      },
      "-=1"
    )
    .to(".map__cluster__info__text", 1, {
      opacity: 1,
      y: "0%",
    })
    .to("#bottom__left", 1, {
      x: "0%",
      scale: 1,
    })
    .to(".map__cluster__overlay", 1, {
      bottom: "100vh",
      //   height: "0",
    })
    .to(
      ".map__cluster__info__text",
      1,
      {
        opacity: 0,
      },
      "-=1"
    )
    .to(
      ".mac__wrapper",
      0.5,
      {
        y: "-100vh",
        x: "0%",
        scale: 1,
      },
      "-=2"
    )
    .to(
      ".there__info__text",
      1,
      {
        y: "-100vh",
        backgroundSize: "200%",
      },
      "-=2"
    )
    .to(
      ".showcase__wrapper",
      2,
      {
        y: "-160vh",
        scale: 1,
      },
      "-=1"
    )
    .to(
      ".there__info__text",
      1,
      {
        opacity: 0,
        backgroundSize: "0%",
      },
      "-=1"
    )
    .to(
      "#phone__left__1",
      2,
      {
        opacity: 1,
        left: "-25%",
      },
      "-=1"
    )
    .to(
      "#phone__right__1",
      2,
      {
        opacity: 1,
        left: "25%",
      },
      "-=2"
    )
    .to(
      "#phone__left__2",
      2,
      {
        opacity: 1,
        left: "-50%",
      },
      "-=1"
    )
    .to(
      "#phone__right__2",
      2,
      {
        opacity: 1,
        left: "50%",
      },
      "-=2"
    )
    .to(
      "#phone__left__2",
      2,
      {
        opacity: 1,
        left: "0%",
      },
      "+=1"
    )
    .to(
      "#phone__right__2",
      2,
      {
        opacity: 1,
        left: "0%",
      },
      "-=2"
    )
    .to(
      "#phone__left__1",
      2,
      {
        opacity: 1,
        left: "0%",
      },
      "-=2"
    )
    .to(
      "#phone__right__1",
      2,
      {
        opacity: 1,
        left: "0%",
      },
      "-=2"
    )
    .to(
      ".showcase__phone",
      4,
      {
        left: "-25%",
      },
      "-=0.1"
    )
    .set("#phone__left__2", { height: "80%" })
    .set("#phone__left__1", { height: "80%" })
    .set("#phone__right__2", { height: "80%" })
    .set("#phone__right__1", { height: "80%" })
    .to(".app__informatic__1", 2, {
      y: "-75vh",
      backgroundSize: "250%",
      opacity: 1,
    })
    .to(
      "#phone__main",
      2,
      {
        opacity: 0,
      },
      "+=1"
    )
    .to(
      ".app__informatic__1",
      1,
      {
        y: "-90vh",
        // backgroundSize: "0%",
        opacity: 0,
      },
      "-=2"
    );

  var hero_laptop_animation = new ScrollMagic.Scene({
    trigger: ".mac__wrapper",
    triggerHook: 0,
    duration: "1200%",
  })
    .setTween(hero_scroll_timeline)
    .setPin(".landing__section")
    // .addIndicators()
    .addTo(hero_controller);

  document.querySelector(".profile-main-loader").style.display = "none";
}

// console.log("ANIMATION");
setTimeout(gsapAnimator, 500);
