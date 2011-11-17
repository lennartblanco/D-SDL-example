import SDL;
import SDL_events;

enum WIDTH  = 640;
enum HEIGHT = 480;
enum BPP    = 4;
enum DEPTH  = 32;

extern (C) int usleep(uint);

void setpixel(SDL_Surface *screen, int x, int y, ubyte r, ubyte g, ubyte b)
{
    uint *pixmem32;
    uint colour;
 
    colour = SDL_MapRGB(screen.format, r, g, b);

    pixmem32 = (screen.pixels + y*screen.pitch/BPP + x);
    *pixmem32 = colour;
}

void draw(SDL_Surface *screen, int h)
{
    foreach (x; 0..screen.w)
    {
        foreach (y; 0..screen.h)
        {
            setpixel(screen, x, y, 
                     cast(ubyte)((x*x)/256+3*y+h),
                     cast(ubyte)((y*y)/256+x+h),
                     cast(ubyte)h);
        }
    }
    SDL_Flip(screen);
}

void main()
{
    SDL_Surface *screen;
    SDL_Event event;
    int h;

    screen = SDL_SetVideoMode(WIDTH, HEIGHT, DEPTH, SDL_HWSURFACE);

    while (true)
    {
        draw(screen, h++);
        SDL_PollEvent(&event);
        if (event.type == EventType.QUIT)
        {
            return;
        }
    
        usleep(10000);
    }
}
