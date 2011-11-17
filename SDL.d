enum SDL_SWSURFACE = 0x00000000; /**< Surface is in system memory */
enum SDL_HWSURFACE = 0x00000001; /**< Surface is in video memory */
enum SDL_ASYNCBLIT = 0x00000004; /**< Use asynchronous blits if possible */
enum SDL_RLEACCEL  = 0x00004000; /**< Surface is RLE encoded */

struct SDL_Rect
{
	short x, y;
	ushort w, h;
}

struct SDL_Surface
{
	uint flags;				/**< Read-only */
	void *format;		    /**< Read-only */
	int w, h;				/**< Read-only */
	ushort pitch;			/**< Read-only */
	uint *pixels;			/**< Read-write */
	int offset;				/**< Private */

	/** Hardware-specific surface info */
	void *hwdata;

	/** clipping information */
	SDL_Rect clip_rect;			/**< Read-only */
	uint unused1;				/**< for binary compatibility */

	/** Allow recursive locks */
	uint locked;				/**< Private */

	/** info for fast blit mapping to other surfaces */
	void *map;		/**< Private */

	/** format version, bumped at every change to invalidate blit maps */
	uint format_version;		/**< Private */

	/** Reference count -- used when freeing surface */
	int refcount;				/**< Read-mostly */
}

extern (C) 
{
    SDL_Surface* SDL_SetVideoMode(int width, int height, int bpp, uint flags);
    void SDL_Flip(SDL_Surface *);
    uint SDL_MapRGB(void *, ubyte, ubyte, ubyte);
}
