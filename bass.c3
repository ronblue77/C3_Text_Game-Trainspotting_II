module bass;

import std::os::win32;

def Win32_HSTREAM = Win32_DWORD;

extern fn CBool bass_init(CInt device, Win32_DWORD freq, Win32_DWORD flags, Win32_HWND win, void *clsid) @extern("BASS_Init");
extern fn void bass_Free() @extern("BASS_Free");
extern fn Win32_HSTREAM bass_StreamCreateFile(CBool mem, char *file, Win32_DWORD offset, Win32_DWORD length, Win32_DWORD flags) @extern("BASS_StreamCreateFile");
extern fn CBool bass_ChannelPlay(Win32_DWORD handle, CBool restart) @extern("BASS_ChannelPlay");
extern fn CBool bass_ChannelFree(Win32_DWORD handle) @extern("BASS_ChannelFree");
extern fn CBool bass_StreamFree(Win32_HSTREAM handle) @extern("BASS_StreamFree");