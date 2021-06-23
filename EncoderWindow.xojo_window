#tag Window
Begin Window EncoderWindow
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   0
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   476
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "Encode"
   Type            =   8
   Visible         =   True
   Width           =   600
   Begin ImageWell InputImageWell
      AllowAutoDeactivate=   True
      Enabled         =   True
      Height          =   150
      Image           =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   113
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   49
      Transparent     =   False
      Visible         =   True
      Width           =   150
   End
   Begin Slider XComponentsSlider
      AllowAutoDeactivate=   True
      AllowLiveScrolling=   False
      Enabled         =   False
      Height          =   23
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   387
      LineStep        =   1
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumValue    =   9
      MinimumValue    =   1
      PageStep        =   20
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TickMarkStyle   =   0
      Tooltip         =   ""
      Top             =   101
      Transparent     =   False
      Value           =   4
      Visible         =   True
      Width           =   100
   End
   Begin Label XComponentsLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   275
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "X Components"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   97
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Slider YComponentsSlider
      AllowAutoDeactivate=   True
      AllowLiveScrolling=   False
      Enabled         =   False
      Height          =   23
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   387
      LineStep        =   1
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumValue    =   9
      MinimumValue    =   1
      PageStep        =   20
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TickMarkStyle   =   0
      Tooltip         =   ""
      Top             =   133
      Transparent     =   False
      Value           =   3
      Visible         =   True
      Width           =   100
   End
   Begin Label YComponentsLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   275
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Y Components"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   129
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin TextArea BlurHashTextArea
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   True
      AllowStyledText =   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      Height          =   169
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   45
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Multiline       =   True
      ReadOnly        =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   226
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   1
      ValidationMask  =   ""
      Visible         =   True
      Width           =   218
   End
   Begin BlurHash.BlurHashCanvas BlurHashPreviewCanvas
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Hash            =   ""
      Height          =   169
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   275
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Punch           =   1.0
      Scope           =   1
      ShowLowQualityPreview=   True
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   226
      Transparent     =   True
      Visible         =   True
      Width           =   280
   End
   Begin Thread EncoderThread
      Index           =   -2147483648
      LockedInPosition=   False
      Priority        =   5
      Scope           =   2
      StackSize       =   0
      TabPanelIndex   =   0
   End
   Begin ProgressWheel EncoderProgressWheel
      AllowAutoDeactivate=   True
      Enabled         =   True
      Height          =   16
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   275
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   164
      Transparent     =   False
      Visible         =   False
      Width           =   16
   End
   Begin PushButton ClosePushButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Close"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   260
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   436
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub EncodeImage()
		  EncoderThread.Stop
		  ImageToEncode = InputImageWell.Image
		  ComponentsX = XComponentsSlider.Value
		  ComponentsY = YComponentsSlider.Value
		  
		  EncoderProgressWheel.Visible = True
		  EncoderThread.Start
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ComponentsX As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		ComponentsY As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		ImageToEncode As Picture
	#tag EndProperty


#tag EndWindowCode

#tag Events InputImageWell
	#tag Event
		Sub Open()
		  Me.AcceptPictureDrop
		  Me.AcceptFileDrop("image/jpeg")
		  Me.AcceptFileDrop("image/png")
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  If Not obj.PictureAvailable And Not obj.FolderItemAvailable Then Return
		  
		  If obj.PictureAvailable Then
		    Me.Image = obj.Picture
		  Elseif obj.FolderItemAvailable Then
		    Me.Image = Picture.Open(obj.FolderItem)
		  End If
		  
		  XComponentsSlider.Enabled = True
		  YComponentsSlider.Enabled = True
		  EncodeImage
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events XComponentsSlider
	#tag Event
		Sub ValueChanged()
		  EncodeImage
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events YComponentsSlider
	#tag Event
		Sub ValueChanged()
		  EncodeImage
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BlurHashTextArea
	#tag Event
		Sub TextChange()
		  BlurHashPreviewCanvas.Hash = Me.Text
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EncoderThread
	#tag Event
		Sub Run()
		  Var encoder As New BlurHash.Encoder
		  Var hash As String = encoder.Encode(ImageToEncode, ComponentsX, ComponentsY)
		  
		  Var update As New Dictionary
		  update.Value("blurhash") = hash
		  
		  Me.AddUserInterfaceUpdate(update)
		End Sub
	#tag EndEvent
	#tag Event
		Sub UserInterfaceUpdate(data() as Dictionary)
		  EncoderProgressWheel.Visible = False
		  Var update As Dictionary = data(data.LastIndex)
		  BlurHashTextArea.Text = update.Value("blurhash")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ClosePushButton
	#tag Event
		Sub Action()
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
