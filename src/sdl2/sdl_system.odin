package sdl2


import c "vendor_c"

when ODIN_OS == .Windows {
//	foreign import lib "sdl2"
} else {
//	foreign import lib "sdl2"
}

// General
@(default_calling_convention="c", link_prefix="SDL_")
foreign {
	IsTablet :: proc() -> bool ---

	/* Functions used by iOS application delegates to notify SDL about state changes */
	OnApplicationWillTerminate                 :: proc() ---
	OnApplicationDidReceiveMemoryWarning       :: proc() ---
	OnApplicationWillResignActive              :: proc() ---
	OnApplicationDidEnterBackground            :: proc() ---
	OnApplicationWillEnterForeground           :: proc() ---
	OnApplicationDidBecomeActive               :: proc() ---
	// iPhoneOS
	OnApplicationDidChangeStatusBarOrientation :: proc() ---
}


// Windows & WinRT

WindowsMessageHook :: proc "c" (userdata: rawptr, hWnd: rawptr, message: c.uint, wParam: u64, lParam: i64)

IDirect3DDevice9 :: struct {}
ID3D11Device     :: struct {}

@(default_calling_convention="c", link_prefix="SDL_")
foreign {
	SetWindowsMessageHook    :: proc(callback: WindowsMessageHook, userdata: rawptr) ---
	Direct3D9GetAdapterIndex :: proc(displayIndex: c.int) -> c.int ---
	RenderGetD3D9Device      :: proc(renderer: ^Renderer) -> ^IDirect3DDevice9 ---
	RenderGetD3D11Device     :: proc(renderer: ^Renderer) -> ^ID3D11Device ---
	DXGIGetOutputInfo        :: proc(displayIndex: c.int, adapterIndex: ^c.int, outputIndex: ^c.int) -> bool ---
}


WinRT_Path :: enum c.int {
	/** \brief The installed app's root directory.
	Files here are likely to be read-only. */
	INSTALLED_LOCATION,

	/** \brief The app's local data store.  Files may be written here */
	LOCAL_FOLDER,

	/** \brief The app's roaming data store.  Unsupported on Windows Phone.
	Files written here may be copied to other machines via a network
	connection.
	*/
	ROAMING_FOLDER,

	/** \brief The app's temporary data store.  Unsupported on Windows Phone.
	Files written here may be deleted at any time. */
	TEMP_FOLDER,
}


WinRT_DeviceFamily :: enum {
	/** \brief Unknown family  */
	UNKNOWN,

	/** \brief Desktop family*/
	DESKTOP,

	/** \brief Mobile family (for example smartphone) */
	MOBILE,

	/** \brief XBox family */
	XBOX,
}

@(default_calling_convention="c", link_prefix="SDL_")
foreign {
	WinRTGetFSPathUNICODE :: proc(pathType: WinRT_Path) -> ^u16 ---
	WinRTGetFSPathUTF8    :: proc(pathType: WinRT_Path) -> cstring ---
	WinRTGetDeviceFamily  :: proc() -> WinRT_DeviceFamily ---
}


// Linux
@(default_calling_convention="c", link_prefix="SDL_")
foreign {
	LinuxSetThreadPriority :: proc(threadID: i64, priority: c.int) -> c.int ---
}


// iOS
iOSSetAnimationCallback :: iPhoneSetAnimationCallback
iOSSetEventPump         :: iPhoneSetEventPump

@(default_calling_convention="c", link_prefix="SDL_")
foreign {
	iPhoneSetAnimationCallback :: proc(window: ^Window, interval: c.int, callback: proc "c" (rawptr), callbackParam: rawptr) -> c.int ---
	iPhoneSetEventPump :: proc(enabled: bool) ---
}



// Android

ANDROID_EXTERNAL_STORAGE_READ  :: 0x01
ANDROID_EXTERNAL_STORAGE_WRITE :: 0x02


@(default_calling_convention="c", link_prefix="SDL_")
foreign {
	AndroidGetJNIEnv               :: proc() -> rawptr ---
	AndroidGetActivity             :: proc() -> rawptr ---
	GetAndroidSDKVersion           :: proc() -> c.int ---
	IsAndroidTV                    :: proc() -> bool ---
	IsChromebook                   :: proc() -> bool ---
	IsDeXMode                      :: proc() -> bool ---
	AndroidBackButton              :: proc() ---
	AndroidGetInternalStoragePath  :: proc() -> cstring ---
	AndroidGetExternalStorageState :: proc() -> c.int ---
	AndroidGetExternalStoragePath  :: proc() -> cstring ---
	AndroidRequestPermission       :: proc(permission: cstring) -> bool ---
	AndroidShowToast               :: proc(message: cstring, duration, gravity, xoffset, yoffset: c.int) -> c.int ---
}
