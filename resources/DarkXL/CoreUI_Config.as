///////////////////////////////
/// XL Engine Config Screen ///
///////////////////////////////

int UIC_ExitBtn0, UIC_ExitBtn1;

void UI_Config_OnEnter()
{
	//Set the virtual screen size.
	UI_GetScreenSize(scrW, scrH);
	virtW = 768*scrW/scrH;
	virtH = 768;
	UI_SetVirtualScreenSize(virtW, virtH);

	//handle widescreen resolutions.
	offset  = (virtW - 1024) / 2;
	extOffs = 0;
	scale  = 1.0f;
	if ( offset > 64 )
	{
		offset = 64;
		if ( virtW > 1152 )
		{
			scale = virtW/1152.0f;
			extOffs = -4;
		}
	}


	//Load the buttons
	UIC_ExitBtn0 = UI_AddImage("DXL_ExitBtn0.png", 0, 0);
	UIC_ExitBtn1 = UI_AddImage("DXL_ExitBtn1.png", 0, 0);
	
	//buttons
	UI_CreateWindow("UIC_ExitBtn", "", 0, int((622+offset)*scale), 652, int(204*scale), 66, UIWinFlag_None);
}

void UI_Config_OnExit()
{
	UI_FreeImage( UIC_ExitBtn0 );
	UI_FreeImage( UIC_ExitBtn1 );
}

void UI_Config_OnRender(int state)
{
	//Render the background.
	UI_RenderRect(0+offset, 0, int(1024*scale), int(768*scale), 0.3f, 0.3f, 0.6f, 1.0f, UI_Align_Left, UI_Align_Bottom);

	//Render version text.
	UI_RenderString("XL Engine Configuration", int((350+offset)*scale), 10, 32, 0.8f, 1.0f, 0.8f, 1.0f);
}

void UI_Config_OnUpdate()
{
	//Mouse over eventually?
}

void UI_Config_OnKey(int key, int msg)
{
	//maybe ENTER to start, ESC for options.
}

//Exit button
void UIC_ExitBtn_OnRender(int state)
{
	UI_SetImageUV_Range(0.0f, 0.0f, 0.53125f, 0.640625f);
	if ( state == 1 )
	{
		UI_RenderImageRect(DXL_ExitBtn1, int((622+offset)*scale), 652, int(204*scale), 66, 1.0, UI_Align_Left, UI_Align_Bottom);
	}
	else
	{
		UI_RenderImageRect(DXL_ExitBtn0, int((622+offset)*scale), 652, int(204*scale), 66, 1.0, UI_Align_Left, UI_Align_Bottom);
	}
	UI_SetImageUV_Range(0.0f, 0.0f, 1.0f, 1.0f);
}

void UIC_ExitBtn_OnRelease()
{
	UI_PopScreen();
}

