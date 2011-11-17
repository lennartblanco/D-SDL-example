/** Event enumerations */
enum EventType : ubyte {
       NOEVENT = 0,     /**< Unused (do not remove) */
       ACTIVEEVENT,     /**< Application loses/gains visibility */
       KEYDOWN,         /**< Keys pressed */
       KEYUP,           /**< Keys released */
       MOUSEMOTION,     /**< Mouse moved */
       MOUSEBUTTONDOWN, /**< Mouse button pressed */
       MOUSEBUTTONUP,   /**< Mouse button released */
       JOYAXISMOTION,   /**< Joystick axis motion */
       JOYBALLMOTION,   /**< Joystick trackball motion */
       JOYHATMOTION,    /**< Joystick hat position change */
       JOYBUTTONDOWN,   /**< Joystick button pressed */
       JOYBUTTONUP,     /**< Joystick button released */
       QUIT,            /**< User-requested quit */
       SYSWMEVENT,      /**< System specific event */
       EVENT_RESERVEDA, /**< Reserved for future use.. */
       EVENT_RESERVEDB, /**< Reserved for future use.. */
       VIDEORESIZE,     /**< User resized video mode */
       VIDEOEXPOSE,     /**< Screen needs to be redrawn */
       EVENT_RESERVED2, /**< Reserved for future use.. */
       EVENT_RESERVED3, /**< Reserved for future use.. */
       EVENT_RESERVED4, /**< Reserved for future use.. */
       EVENT_RESERVED5, /**< Reserved for future use.. */
       EVENT_RESERVED6, /**< Reserved for future use.. */
       EVENT_RESERVED7, /**< Reserved for future use.. */
       /** Events SDL_USEREVENT through SDL_MAXEVENTS-1 are for your use */
       USEREVENT = 24,
       /** This last event is only for bounding internal arrays
        *  It is the number of bits in the event mask datatype -- Uint32
        */
       SDL_NUMEVENTS = 32
}

struct SDL_Event
{
    EventType type;
    int dummy0;
    int dummy1;
    int dummy2;
    int dummy3;
    int dummy4;
    int dummy5;
    int dummy6;
    int dummy7;
}

extern (C)
{
    int SDL_PollEvent(SDL_Event *);
    int SDL_WaitEvent(SDL_Event *);
}
