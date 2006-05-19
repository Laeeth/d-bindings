/***********************************************************************\
*                               exdisp.d                                *
*                                                                       *
*                       Windows API header module                       *
*                                                                       *
*                 Translated from MinGW Windows headers                 *
*                                                                       *
*                       Placed into public domain                       *
\***********************************************************************/
module win32.exdisp;

import win32.oaidl;
import win32.ocidl;
import win32.docobj;
private import win32.wtypes;


enum BrowserNavConstants {
	navOpenInNewWindow = 0x1,
	navNoHistory = 0x2,
	navNoReadFromCache = 0x4,
	navNoWriteTocache = 0x8,
	navAllowAutosearch = 0x10,
	navBrowserBar = 0x20,
	navHyperLink = 0x40
}

extern (C) {
extern CLSID CLSID_WebBrowser;
extern IID DIID_DWebBrowserEvents;
extern IID IID_IWebBrowser;
extern IID IID_IWebBrowserApp;
extern IID IID_IWebBrowser2;
extern IID DIID_DWebBrowserEvents2;
}

interface IWebBrowser : public IDispatch
{
	HRESULT QueryInterface(REFIID,PVOID*);
	ULONG AddRef();
	ULONG Release();
	HRESULT GetTypeInfoCount(UINT*);
	HRESULT GetTypeInfo(UINT,LCID,LPTYPEINFO*);
	HRESULT GetIDsOfNames(REFIID,LPOLESTR*,UINT,LCID,DISPID*);
	HRESULT Invoke(DISPID,REFIID,LCID,WORD,DISPPARAMS*,VARIANT*,EXCEPINFO*,UINT*);

	HRESULT GoBack();
	HRESULT GoForward();
	HRESULT GoHome();
	HRESULT GoSearch();
	HRESULT Navigate(BSTR,VARIANT*,VARIANT*,VARIANT*,VARIANT*);
	HRESULT Refresh();
	HRESULT Refresh2(VARIANT*);
	HRESULT Stop();
	HRESULT get_Application(IDispatch**);
	HRESULT get_Parent(IDispatch**);
	HRESULT get_Container(IDispatch**);
	HRESULT get_Document(IDispatch**);
	HRESULT get_TopLevelContainer(VARIANT_BOOL*);
	HRESULT get_Type(BSTR*);
	HRESULT get_Left(long*);
	HRESULT put_Left(long);
	HRESULT get_Top(long*);
	HRESULT put_Top(long);
	HRESULT get_Width(long*);
	HRESULT put_Width(long);
	HRESULT get_Height(long*);
	HRESULT put_Height(long);
	HRESULT get_LocationName(BSTR*);
	HRESULT get_LocationURL(BSTR*);
	HRESULT get_Busy(VARIANT_BOOL*);
}

interface IWebBrowserApp : public IWebBrowser
{
	HRESULT QueryInterface(REFIID,PVOID*);
	ULONG AddRef();
	ULONG Release();
	HRESULT GetTypeInfoCount(UINT*);
	HRESULT GetTypeInfo(UINT,LCID,LPTYPEINFO*);
	HRESULT GetIDsOfNames(REFIID,LPOLESTR*,UINT,LCID,DISPID*);
	HRESULT Invoke(DISPID,REFIID,LCID,WORD,DISPPARAMS*,VARIANT*,EXCEPINFO*,UINT*);

	HRESULT GoBack();
	HRESULT GoForward();
	HRESULT GoHome();
	HRESULT GoSearch();
	HRESULT Navigate(BSTR,VARIANT*,VARIANT*,VARIANT*,VARIANT*);
	HRESULT Refresh();
	HRESULT Refresh2(VARIANT*);
	HRESULT Stop();
	HRESULT get_Application(IDispatch**);
	HRESULT get_Parent(IDispatch**);
	HRESULT get_Container(IDispatch**);
	HRESULT get_Document(IDispatch**);
	HRESULT get_TopLevelContainer(VARIANT_BOOL*);
	HRESULT get_Type(BSTR*);
	HRESULT get_Left(long*);
	HRESULT put_Left(long);
	HRESULT get_Top(long*);
	HRESULT put_Top(long);
	HRESULT get_Width(long*);
	HRESULT put_Width(long);
	HRESULT get_Height(long*);
	HRESULT put_Height(long);
	HRESULT get_LocationName(BSTR*);
	HRESULT get_LocationURL(BSTR*);
	HRESULT get_Busy(VARIANT_BOOL*);

	HRESULT Quit();
	HRESULT ClientToWindow(int*,int*);
	HRESULT PutProperty(BSTR,VARIANT);
	HRESULT GetProperty(BSTR,VARIANT*);
	HRESULT get_Name(BSTR*);
	HRESULT get_HWND(long*);
	HRESULT get_FullName(BSTR*);
	HRESULT get_Path(BSTR*);
	HRESULT get_Visible(VARIANT_BOOL*);
	HRESULT put_Visible(VARIANT_BOOL);
	HRESULT get_StatusBar(VARIANT_BOOL*);
	HRESULT put_StatusBar(VARIANT_BOOL);
	HRESULT get_StatusText(BSTR*);
	HRESULT put_StatusText(BSTR);
	HRESULT get_ToolBar(int*);
	HRESULT put_ToolBar(int);
	HRESULT get_MenuBar(VARIANT_BOOL*);
	HRESULT put_MenuBar(VARIANT_BOOL);
	HRESULT get_FullScreen(VARIANT_BOOL*);
	HRESULT put_FullScreen(VARIANT_BOOL);
}

interface IWebBrowser2 : public IWebBrowserApp
{
	HRESULT QueryInterface(REFIID,PVOID*);
	ULONG AddRef();
	ULONG Release();
	HRESULT GetTypeInfoCount(UINT*);
	HRESULT GetTypeInfo(UINT,LCID,LPTYPEINFO*);
	HRESULT GetIDsOfNames(REFIID,LPOLESTR*,UINT,LCID,DISPID*);
	HRESULT Invoke(DISPID,REFIID,LCID,WORD,DISPPARAMS*,VARIANT*,EXCEPINFO*,UINT*);

	HRESULT GoBack();
	HRESULT GoForward();
	HRESULT GoHome();
	HRESULT GoSearch();
	HRESULT Navigate(BSTR,VARIANT*,VARIANT*,VARIANT*,VARIANT*);
	HRESULT Refresh();
	HRESULT Refresh2(VARIANT*);
	HRESULT Stop();
	HRESULT get_Application(IDispatch**);
	HRESULT get_Parent(IDispatch**);
	HRESULT get_Container(IDispatch**);
	HRESULT get_Document(IDispatch**);
	HRESULT get_TopLevelContainer(VARIANT_BOOL*);
	HRESULT get_Type(BSTR*);
	HRESULT get_Left(long*);
	HRESULT put_Left(long);
	HRESULT get_Top(long*);
	HRESULT put_Top(long);
	HRESULT get_Width(long*);
	HRESULT put_Width(long);
	HRESULT get_Height(long*);
	HRESULT put_Height(long);
	HRESULT get_LocationName(BSTR*);
	HRESULT get_LocationURL(BSTR*);
	HRESULT get_Busy(VARIANT_BOOL*);

	HRESULT Quit();
	HRESULT ClientToWindow(int*,int*);
	HRESULT PutProperty(BSTR,VARIANT);
	HRESULT GetProperty(BSTR,VARIANT*);
	HRESULT get_Name(BSTR*);
	HRESULT get_HWND(long*);
	HRESULT get_FullName(BSTR*);
	HRESULT get_Path(BSTR*);
	HRESULT get_Visible(VARIANT_BOOL*);
	HRESULT put_Visible(VARIANT_BOOL);
	HRESULT get_StatusBar(VARIANT_BOOL*);
	HRESULT put_StatusBar(VARIANT_BOOL);
	HRESULT get_StatusText(BSTR*);
	HRESULT put_StatusText(BSTR);
	HRESULT get_ToolBar(int*);
	HRESULT put_ToolBar(int);
	HRESULT get_MenuBar(VARIANT_BOOL*);
	HRESULT put_MenuBar(VARIANT_BOOL);
	HRESULT get_FullScreen(VARIANT_BOOL*);
	HRESULT put_FullScreen(VARIANT_BOOL);

	HRESULT Navigate2(VARIANT*,VARIANT*,VARIANT*,VARIANT*,VARIANT*);
	HRESULT QueryStatusWB(OLECMDID,OLECMDF*);
	HRESULT ExecWB(OLECMDID,OLECMDEXECOPT,VARIANT*,VARIANT*);
	HRESULT ShowBrowserBar(VARIANT*,VARIANT*,VARIANT*);
	HRESULT get_ReadyState(READYSTATE*);
	HRESULT get_Offline(VARIANT_BOOL*);
	HRESULT put_Offline(VARIANT_BOOL);
	HRESULT get_Silent(VARIANT_BOOL*);
	HRESULT put_Silent(VARIANT_BOOL);
	HRESULT get_RegistaerAsBrowser(VARIANT_BOOL*);
	HRESULT put_RegisterAsBrowser(VARIANT_BOOL);
	HRESULT get_RegistaerAsDropTarget(VARIANT_BOOL*);
	HRESULT put_RegisterAsDropTarget(VARIANT_BOOL);
	HRESULT get_TheaterMode(VARIANT_BOOL*);
	HRESULT put_TheaterMode(VARIANT_BOOL);
	HRESULT get_AddressBar(VARIANT_BOOL*);
	HRESULT put_AddressBar(VARIANT_BOOL);
	HRESULT get_Resizable(VARIANT_BOOL*);
	HRESULT put_Resizable(VARIANT_BOOL);
}

interface DWebBrowserEvents2 : public IDispatch
{
	HRESULT QueryInterface(REFIID,PVOID*);
	ULONG AddRef();
	ULONG Release();
	HRESULT GetTypeInfoCount(UINT*);
	HRESULT GetTypeInfo(UINT,LCID,LPTYPEINFO*);
	HRESULT GetIDsOfNames(REFIID,LPOLESTR*,UINT,LCID,DISPID*);
	HRESULT Invoke(DISPID,REFIID,LCID,WORD,DISPPARAMS*,VARIANT*,EXCEPINFO*,UINT*);

	void StatusTextChange(BSTR);
	void ProgressChange(long,long);
	void CommandStateChange(long,VARIANT_BOOL);
	void DownloadBegin();
	void DownloadComplete();
	void TitleChange(BSTR);
	void PropertyChange(BSTR);
	void BeforeNavigate2(IDispatch*,VARIANT*,VARIANT*,VARIANT*,VARIANT*,VARIANT*,VARIANT_BOOL*);
	void NewWindow2(IDispatch**,VARIANT_BOOL*);
	void NavigateComplete(IDispatch*,VARIANT*);
	void DocumentComplete(IDispatch*,VARIANT*);
	void OnQuit();
	void OnVisible(VARIANT_BOOL);
	void OnToolBar(VARIANT_BOOL);
	void OnMenuBar(VARIANT_BOOL);
	void OnStatusBar(VARIANT_BOOL);
	void OnFullScreen(VARIANT_BOOL);
	void OnTheaterMode(VARIANT_BOOL);
	void WindowSetResizable(VARIANT_BOOL);
	void WindowSetLeft(long);
	void WindowSetTop(long);
	void WindowSetWidth(long);
	void WindowSetHeight(long);
	void WindowClosing(VARIANT_BOOL,VARIANT_BOOL*);
	void ClientToHostWindow(long*,long*);
	void SetSecureLockIcon(long);
	void FileDownload(VARIANT_BOOL*);
}