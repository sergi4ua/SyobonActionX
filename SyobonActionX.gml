#define SS_Init

//Call this to start the system

global.dll_SS_Init = external_define(
  "libs\supersound.dll",
  "SS_Init",
  dll_stdcall,
  ty_string,
  0);

global.dll_SS_Unload = external_define(
  "libs\supersound.dll",
  "SS_Init",
  dll_stdcall,
  ty_string,
  0);

global.dll_SS_LoadSound = external_define(
  "libs\supersound.dll",
  "SS_LoadSound",
  dll_stdcall,
  ty_string,
  2,
  ty_string,
  ty_string);

global.dll_SS_PlaySound = external_define(
  "libs\supersound.dll",
  "SS_PlaySound",
  dll_stdcall,
  ty_string,
  1,
  ty_string);

global.dll_SS_LoopSound = external_define(
  "libs\supersound.dll",
  "SS_LoopSound",
  dll_stdcall,
  ty_string,
  1,
  ty_string);


global.dll_SS_StopSound = external_define(
  "libs\supersound.dll",
  "SS_StopSound",
  dll_stdcall,
  ty_string,
  1,
  ty_string);

global.dll_SS_SetSoundFreq = external_define(
  "libs\supersound.dll",
  "SS_SetSoundFreq",
  dll_stdcall,
  ty_string,
  2,
  ty_string,
  ty_string);

global.dll_SS_SetSoundPan = external_define(
  "libs\supersound.dll",
  "SS_SetSoundPan",
  dll_stdcall,
  ty_string,
  2,
  ty_string,
  ty_string);

global.dll_SS_SetSoundVol = external_define(
  "libs\supersound.dll",
  "SS_SetSoundVol",
  dll_stdcall,
  ty_string,
  2,
  ty_string,
  ty_string);

global.dll_SS_FreeSound = external_define(
  "libs\supersound.dll",
  "SS_FreeSound",
  dll_stdcall,
  ty_string,
  1,
  ty_string);

global.dll_SS_IsSoundPlaying = external_define(
  "libs\supersound.dll",
  "SS_IsSoundPlaying",
  dll_stdcall,
  ty_string,
  1,
  ty_string);

global.dll_SS_GetSoundPosition = external_define(
  "libs\supersound.dll",
  "SS_GetSoundPosition",
  dll_stdcall,
  ty_string,
  1,
  ty_string);

global.dll_SS_SetSoundPosition = external_define(
  "libs\supersound.dll",
  "SS_SetSoundPosition",
  dll_stdcall,
  ty_string,
  2,
  ty_string,
  ty_string);

global.dll_SS_GetSoundLength = external_define(
  "libs\supersound.dll",
  "SS_GetSoundLength",
  dll_stdcall,
  ty_string,
  1,
  ty_string);
  
global.dll_SS_GetSoundBytesPerSecond = external_define(
  "libs\supersound.dll",
  "SS_GetSoundBytesPerSecond",
  dll_stdcall,
  ty_string,
  1,
  ty_string);

global.dll_SS_GetSoundVol = external_define(
  "libs\supersound.dll",
  "SS_GetSoundVol",
  dll_stdcall,
  ty_string,
  1,
  ty_string);

global.dll_SS_GetSoundFreq = external_define(
  "libs\supersound.dll",
  "SS_GetSoundFreq",
  dll_stdcall,
  ty_string,
  1,
  ty_string);

global.dll_SS_GetSoundPan = external_define(
  "libs\supersound.dll",
  "SS_GetSoundPan",
  dll_stdcall,
  ty_string,
  1,
  ty_string);

global.dll_SS_IsSoundLooping = external_define(
  "libs\supersound.dll",
  "SS_IsSoundLooping",
  dll_stdcall,
  ty_string,
  1,
  ty_string);

global.dll_SS_IsSoundPaused = external_define(
  "libs\supersound.dll",
  "SS_IsSoundPaused",
  dll_stdcall,
  ty_string,
  1,
  ty_string);

global.dll_SS_ResumeSound = external_define(
  "libs\supersound.dll",
  "SS_ResumeSound",
  dll_stdcall,
  ty_string,
  1,
  ty_string);

global.dll_SS_PauseSound = external_define(
  "libs\supersound.dll",
  "SS_PauseSound",
  dll_stdcall,
  ty_string,
  1,
  ty_string);

//


if external_call(global.dll_SS_Init) = "No" then begin
  show_error("Initialization of the sound system failed!",0);
end;










#define SS_Unload

// Call this before the game ends
/*
    Use it only ONCE, and do not use ANY other SS_ scripts
    afterwards, not even SS_Init()!
*/


external_call(global.dll_SS_Unload);


#define SS_LoadSound

//Load a sound in ogg or wav format into memory

/*
argument0: filename
argument1 (optional): 1 to stream the sound instead
                        of loading it all at once.
            (default) 0 to load it all at once
*/

/*
return: sound handle if successful or "0" as string else
*/

if is_real(argument0) then return "0"
return external_call(global.dll_SS_LoadSound, argument0, string(argument1));



#define SS_PlaySound

//Play a sound (once)

/*
argument0: sound handle as returned by SS_LoadSound
*/

/*
return: nothing
*/

if is_real(argument0) then return "0"
return external_call(global.dll_SS_PlaySound,argument0);



#define SS_LoopSound

//Start looping a sound. It will play until you stop it.

/*
argument0: sound handle as returned by SS_LoadSound
*/

/*
return: nothing
*/

if is_real(argument0) then return "0"
return external_call(global.dll_SS_LoopSound,argument0);



#define SS_StopSound

//Stop a playing sound. Especially useful with looped sounds.

/*
argument0: sound handle as returned by SS_LoadSound
*/

/*
return: void
*/

if is_real(argument0) then return "0"
return external_call(global.dll_SS_StopSound,argument0);



#define SS_SetSoundFreq

//Set the frequency of a sound (in Hz)

/*
argument0: Sound handle as returned by LoadSound
argument1: Hz as real or string. Valid values are from 1000 Hz to 100 000 Hz
*/

/*
return: "0" as string for failure and "1" as string for success.
*/

if is_real(argument0) then return "0";
if is_string(argument1) then begin
  return external_call(global.dll_SS_SetSoundFreq,argument0,argument1);
end else begin
  return external_call(global.dll_SS_SetSoundFreq,argument0,string(argument1));
end;



#define SS_SetSoundPan

//Set the panning of a sound

/*
argument0: Sound handle as returned by LoadSound
argument1: Pan as real or string. -10 000 is full left
                                   10 000 is full right
                                   0 is centred
*/

/*
return: "0" as string for failure and "1" as string for success.
*/

if is_real(argument0) then return "0";
if is_string(argument1) then begin
  return external_call(global.dll_SS_SetSoundPan,argument0,argument1);
end else begin
  return external_call(global.dll_SS_SetSoundPan,argument0,string(argument1));
end;



#define SS_SetSoundVol

//Set the volume of a sound

/*
argument0: Sound handle as returned by LoadSound
argument1: Volume as real or string. 0 is muted, 10 000 is full volume.
*/

/*
return: "0" as string for failure and "1" as string for success.
*/

if is_real(argument0) then return "0";
if is_string(argument1) then begin
  return external_call(global.dll_SS_SetSoundVol,
                       argument0,
                       string(real(argument1)-10000)
  );
end else begin
  return external_call(global.dll_SS_SetSoundVol,
                       argument0,
                       string(argument1-10000)
  );
end;






#define SS_FreeSound

//Unload a sound from memory

//Normally not needed unless you've got a lot of sounds
//or use some very large sounds

/*
argument0: sound handle as returned by SS_LoadSound
*/

/*
return: nothing
*/

if is_real(argument0) then return "0"
external_call(global.dll_SS_StopSound,argument0);
return external_call(global.dll_SS_FreeSound,argument0);



#define SS_IsSoundPlaying

//Check if the specified sound is currently playing (or looping)

/*
argument0: sound handle as returned by SS_LoadSound
*/

/*
return: 1/0/-1 (true/false/error) as real
-1 if sound doesn't exist or there was another error

It returns 0 if the sound is paused or stopped. If you
want to check whether a sound is paused, use SS_IsSoundPaused()

If the sound is playing it returns 1.
*/

if is_real(argument0) then return -1;
return real(external_call(global.dll_SS_IsSoundPlaying,argument0));








#define SS_IsSoundLooping

//Check if the specified playing sound is set to loop

/*
argument0: sound handle as returned by SS_LoadSound
*/

/*
return: true/false/-1 as real
-1 if sound doesn't exist or there was another error
*/

if is_real(argument0) then return -1;
return real(external_call(global.dll_SS_IsSoundLooping,argument0));








#define SS_GetSoundVol

//Get the volume of a sound

/*
argument0: Sound handle as returned by LoadSound
*/

/*
return: volume as real or -1 if there was an error (ie. the sound
doesn't exist). See the script SS_SetSoundVol for valid volume range
*/

if is_real(argument0) then return "-1";
return real(external_call(global.dll_SS_GetSoundVol, argument0))+10000;



#define SS_GetSoundPan

//Get the current panning of a sound

/*
argument0: Sound handle as returned by LoadSound
*/

/*
return: panning as real
See the script SS_SetSoundPan for valid range
*/

if is_real(argument0) then return "0";
return real(external_call(global.dll_SS_GetSoundPan, argument0));





#define SS_GetSoundFreq

//Get the current frequency of a sound

/*
argument0: Sound handle as returned by LoadSound
*/

/*
return: frequency as real or -1 if there was an error (ie. the sound
doesn't exist). See the script SS_SetSoundFreq for valid range
*/

if is_real(argument0) then return -1;
return real(external_call(global.dll_SS_GetSoundFreq, argument0));




#define SS_GetSoundPosition

//Gets the current position in bytes

/*
argument0: sound handle as returned by SS_LoadSound
*/

/*
return: the current position in bytes as real or an error
code less than 0 as real if there was an error (like the
sound doesn't exist)
*/

if is_real(argument0) then return -1;
return real(external_call(global.dll_SS_GetSoundPosition,argument0));




#define SS_GetSoundLength

//Gets the length in bytes

/*
argument0: sound handle as returned by SS_LoadSound
*/

/*
return: an error code less than 0 as real if unsuccessful,
the length in bytes as real if successful.
*/

if is_real(argument0) then return 0;
return real(external_call(global.dll_SS_GetSoundLength,argument0));




#define SS_SetSoundPosition

//Sets the current position in bytes

/*
argument0: sound handle as returned by SS_LoadSound
argument1: new sound position in bytes as real
*/

/*
return: 0 as real if unsuccessful, 1 as real if successful
*/

if is_real(argument0) then return 0;
if is_string(argument1) then return 0;
return real(external_call(global.dll_SS_SetSoundPosition,argument0,string(argument1)))+1;




#define SS_GetSoundBytesPerSecond

//Sets the current position in bytes

/*
argument0: sound handle as returned by SS_LoadSound
*/

/*
return: 0 as real if unsuccessful, BPS as real if successful
*/

if is_real(argument0) then return 0;
return real(external_call(global.dll_SS_GetSoundBytesPerSecond, argument0));


#define SS_IsHandleValid

//Check if the specified sound handle is a valid sound handle
//This function is bulletproof and can be used with any value

/*
argument0: sound handle
*/

/*
return: true/false
*/

if is_real(argument0) then return -1;
switch external_call(global.dll_SS_IsSoundPlaying,argument0) begin
  case "1":   return 1;
  case "0":    return 1;
  case "-1": return 0;
end;


#define SS_IsSoundPaused

//Check if the specified sound is currently paused

/*
argument0: sound handle as returned by SS_LoadSound
*/

/*
return: true/false/-1
*/


if is_real(argument0) then return -1;
return real(external_call(global.dll_SS_IsSoundPaused,argument0));







#define SS_PauseSound

//Pause a playing sound

/*
argument0: Sound handle as returned by LoadSound
*/

/*
return: nothing
*/



if is_real(argument0) then return -1;
return real(external_call(global.dll_SS_PauseSound,argument0));











#define SS_ResumeSound

//Resume a paused sound
//If the sound was stopped it will start playing from the start.
//If the sound is already playng it will simply continue playing

/*
argument0: Sound handle as returned by LoadSound
*/

/*
return: 1 for success, 0 for failure
*/

if is_real(argument0) then return -1;
return real(external_call(global.dll_SS_ResumeSound,argument0));




#define scr_editor_save_level
global.saving = true;
var filename;
var file;
var pressed;

// SAVE FILE DIALOG

filename = get_save_filename("Syobon Action X Level Files (*.sax)|*.sax","1-1.sax");

if(filename == "")
    exit;
    
if filename_ext(filename) == ""
{
    filename = filename + ".sax";
}

// deactivate objects that not needed

instance_deactivate_object(obj_cursor);
instance_deactivate_object(obj_editor_controller);
instance_deactivate_object(obj_initss);

// write level data to file

file = file_text_open_write(filename);

// write global data to file
if(global.protectlevel == false)
{
file_text_write_string(file,"SERGIOUS_SAX1"); // level version
file_text_writeln(file);
}
else
{
file_text_write_string(file,"TPAK_@SAX1"); // protect version
file_text_writeln(file);
}
file_text_write_string(file,global.musicfile);
file_text_writeln(file);
file_text_write_string(file,global.nextlevel);
file_text_writeln(file);
file_text_write_string(file,global.levelmsg);
file_text_writeln(file);
file_text_write_string(file,"null");
file_text_writeln(file);
file_text_write_string(file,"null");
file_text_writeln(file);
file_text_write_real(file,global.level_background);
file_text_writeln(file);
file_text_write_real(file,0);
file_text_writeln(file);
file_text_write_real(file,0);
file_text_writeln(file);
file_text_write_real(file,0);
file_text_writeln(file);
if(global.protectlevel == true)
{
    instance_create(0,0,obj_protectlevel);
}
instance_create(0,0,obj_dummy);
instance_create(0,0,obj_dummy);
instance_create(0,0,obj_dummy);
file_text_write_real(file,instance_count);
file_text_writeln(file);

for(i = 0; i < instance_count; i+= 1)
{
    with (instance_id[i]) {
        file_text_write_string(file, object_get_name(object_index));
        file_text_writeln(file);
        file_text_write_real(file, x);
        file_text_writeln(file);
        file_text_write_real(file, y);
        file_text_writeln(file);
    }
}

file_text_close(file);
SS_PlaySound(global.sfx_editorsaved);
//wd_message_simple("Level saved to: " + filename);
instance_activate_all();
global.protectlevel = false;
global.saving = false;

if(instance_exists(obj_hourglass))
{
    with(obj_hourglass)
        instance_destroy();
}

#define scr_editor_load_level
{
var filename;
var file;
var pressed;

var LEVEL_VERSION; // level version
var LEVEL_MUSICFILE; // level music
var LEVEL_STRINGDATA; // various strings
var LEVEL_INTEGERDATA; // various integers (level width, background, etc...)
var LEVEL_OBJECTCOUNT; // var contains the total number of objects in the level

// level info
var LEVEL_OBJECTNAME;
var LEVEL_OBJECTX;
var LEVEL_OBJECTY;

var iterator;

// open file dialog

instance_create(0,0,obj_hourglass);

filename = get_open_filename("Syobon Action X levels (*.sax)|*.sax", "1-1.sax");
if(filename == "")
    exit;
    
// deactivate the editor objects and clear the room
instance_deactivate_object(obj_cursor);
instance_deactivate_object(obj_editor_controller);
instance_deactivate_object(obj_initss);
instance_deactivate_object(obj_hourglass);

for(i = 0; i < instance_count; i += 1)
{
    with (instance_id[i]) {
        instance_destroy();
    }
}

// open the level file for reading
file = file_text_open_read(filename);

// get the level version

LEVEL_VERSION = file_text_read_string(file);
file_text_readln(file);
if(LEVEL_VERSION != "SERGIOUS_SAX1")
{
    wd_message_set_text("Couldn't load file: unknown level version.");
    wd_message_show(wd_mk_error,wd_mb_ok,wd_mb_none,wd_mb_none);
    game_end();
}
// get the level music filename
global.musicfile = file_text_read_string(file);
file_text_readln(file);
//show_message(LEVEL_MUSICFILE);
// loop
for(a = 0; a < 4; a += 1)
{
    LEVEL_STRINGDATA[a] = file_text_read_string(file);
    file_text_readln(file);
   // show_message(LEVEL_STRINGDATA[a]);
}
for(b = 0; b < 4; b += 1)
{
    LEVEL_REALDATA[b] = file_text_read_real(file);
    file_text_readln(file);
    //show_message(LEVEL_REALDATA[b]);
}
// get the object count
LEVEL_OBJECTCOUNT = file_text_read_real(file);
file_text_readln(file);
//show_message(string(LEVEL_OBJECTCOUNT));
// create the objects

for(c = 0; c < LEVEL_OBJECTCOUNT; c += 1)
{
    LEVEL_OBJECTNAME[c] = file_text_read_string(file);
    file_text_readln(file);
    LEVEL_OBJECTX[c] = file_text_read_real(file);
    file_text_readln(file);
    LEVEL_OBJECTY[c] = file_text_read_real(file);
    file_text_readln(file);
    //show_message(string(c) + "#" + LEVEL_OBJECTNAME[c] + "#" + string(LEVEL_OBJECTX[c]) + "#" + string(LEVEL_OBJECTY[c]))
    execute_string("instance_create(" + string(LEVEL_OBJECTX[c]) + ","+string(LEVEL_OBJECTY[c]) + "," + string(LEVEL_OBJECTNAME[c]) + ")");
}

file_text_close(file);
instance_activate_all();

view_xview[0] = 0;

if(LEVEL_STRINGDATA[0] == "null")
    LEVEL_STRINGDATA[0] = "exit";
global.nextlevel = LEVEL_STRINGDATA[0];

switch(LEVEL_REALDATA[0])
{
    case 0:
        background_color = make_color_rgb(160,180,250);
    break;
        
    case 1:
        background_color = c_black;
    break;
        
    default:
        background_color = make_color_rgb(160,180,250);
    break;
}

global.levelmsg = LEVEL_STRINGDATA[1];
global.level_background = LEVEL_REALDATA[0];

with(obj_hourglass)
{   
    alarm[0] = 15;
}
global.protectlevel = false;
}

#define scr_editor_newlevel
wd_message_set_text("Warning! All unsaved changes will be lost! Are you sure you want to continue?");
if(wd_message_show(wd_mk_warning,wd_mb_yes,wd_mb_no,wd_mb_none) == wd_mb_no )
{
    exit;
}

instance_deactivate_object(obj_cursor);
instance_deactivate_object(obj_editor_controller);
instance_deactivate_object(obj_initss);

for(i = 0; i < instance_count; i += 1)
{
    with (instance_id[i]) {
        instance_destroy();
    }
}

if(SS_IsSoundPlaying(global.levelmusic))
{
    SS_StopSound(global.levelmusic);
    global.levelmusic = 0;   
}

// play the bomb sound >)

instance_activate_all();
SS_PlaySound(global.sfx_bomb);

#define screen_init
// screen base(view_wview and view_hview)
screen_x = 0;
screen_y = 0;
screen_w = 640;
screen_h = 480;
screen_scale = 2;

// create a surface for the whole screen to be drawn on
screen = surface_create(screen_w,screen_h);

// this will destroy the screen object if surfaces are not supported on the graphics card, reverting to the viewport method
if screen = -1{instance_destroy();}

#define screen_begin
surface_reset_target();
draw_clear(0);
draw_set_blend_mode_ext(bm_one, bm_zero);
draw_surface_stretched(screen,screen_x,screen_y,screen_w*screen_scale,screen_h*screen_scale);
draw_set_blend_mode(bm_normal);
screen_refresh();

#define screen_exit
surface_set_target(screen);

#define read_main_config
ini_open("config.ini")
if(ini_read_real("Options","ForceRealFullscreen",0) == 1)
{
    wd_message_set_text("Warning: real fullscreen can make explorer.exe extremely buggy. If you experience problem, relaunch explorer.exe from task manager. You have been warned.")
    if(wd_message_show(wd_mk_warning,wd_mb_yes,wd_mb_no,wd_mb_none) == wd_mb_yes)
    {
        display_set_size(640,480);
        window_set_fullscreen(true);
    }
    else
    {
        game_end();
    }  
}
if(ini_read_real("Options","ForceFullscreen",0) == 1)
{
    window_set_fullscreen(true);
}
global.lvltoload = ini_read_string("Universe","StartupLevel","1-1.sax");

ini_close()



#define load_level
// loads level file created in the level editor
{
var filename;
filename = argument0
var file;
var pressed;
var protected;
protected = false;

var LEVEL_VERSION; // level version
var LEVEL_MUSICFILE; // level music
var LEVEL_STRINGDATA; // various strings
var LEVEL_INTEGERDATA; // various integers (level width, background, etc...)
var LEVEL_OBJECTCOUNT; // var contains the total number of objects in the level

// level info
var LEVEL_OBJECTNAME;
var LEVEL_OBJECTX;
var LEVEL_OBJECTY;
var music;
// open file dialog

instance_create(0,0,obj_hourglass);

if(!file_exists(filename))
{
    wd_message_set_text("couldn't open: " + filename);
    wd_message_show(wd_mk_error, wd_mb_ok,wd_mb_none,wd_mb_none);
    game_end();
}

file = file_text_open_read(filename);
// get the level version

LEVEL_VERSION = file_text_read_string(file);
file_text_readln(file);
if(LEVEL_VERSION == "TPAK_@SAX1") { protected = true; show_debug_message("Loading protected level.")};

if(LEVEL_VERSION != "SERGIOUS_SAX1" and protected == false)
{
    wd_message_set_text("Couldn't load file: unknown level version.");
    wd_message_show(wd_mk_error,wd_mb_ok,wd_mb_none,wd_mb_none);
    game_end();
}
if(LEVEL_VERSION == "TPAK_@SAX1") { show_debug_message("Loading protected level.")};
// get the level music filename
LEVEL_MUSICFILE = file_text_read_string(file);
file_text_readln(file);
//show_message(LEVEL_MUSICFILE);
// loop
for(a = 0; a < 4; a += 1)
{
    LEVEL_STRINGDATA[a] = file_text_read_string(file);
    file_text_readln(file);
   // show_message(LEVEL_STRINGDATA[a]);
}
for(b = 0; b < 4; b += 1)
{
    LEVEL_REALDATA[b] = file_text_read_real(file);
    file_text_readln(file);
    //show_message(LEVEL_REALDATA[b]);
}
// get the object count
LEVEL_OBJECTCOUNT = file_text_read_real(file);
file_text_readln(file);
//show_message(string(LEVEL_OBJECTCOUNT));
// create the objects

for(c = 0; c < LEVEL_OBJECTCOUNT; c += 1)
{
    LEVEL_OBJECTNAME[c] = file_text_read_string(file);
    file_text_readln(file);
    LEVEL_OBJECTX[c] = file_text_read_real(file);
    file_text_readln(file);
    LEVEL_OBJECTY[c] = file_text_read_real(file);
    file_text_readln(file);
    //show_message(string(c) + "#" + LEVEL_OBJECTNAME[c] + "#" + string(LEVEL_OBJECTX[c]) + "#" + string(LEVEL_OBJECTY[c]))
    execute_string("instance_create(" + string(LEVEL_OBJECTX[c]) + ","+string(LEVEL_OBJECTY[c]) + "," + string(LEVEL_OBJECTNAME[c]) + ")");
}

file_text_close(file);
instance_activate_all();

view_xview[0] = 0;

with(obj_hourglass)
{   
    alarm[0] = 15;
}

// copy local vars intro level globals
for(sdata = 0; sdata < 4; sdata+=1)
    {
        global.LEVEL_STRING[sdata] = LEVEL_STRINGDATA[sdata];
        global.LEVEL_REAL[sdata] = LEVEL_REALDATA[sdata];        
    }

global.nextlvl = LEVEL_STRINGDATA[0];
    
SS_FreeSound(global.levelmusic);
global.levelmusic = 0;
music = SS_LoadSound("music\" + LEVEL_MUSICFILE,1);
global.levelmusic = music;

global.levelmsg = LEVEL_STRINGDATA[1];
global.level_background = LEVEL_REALDATA[0];
}

